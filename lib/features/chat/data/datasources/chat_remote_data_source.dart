import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/exceptions.dart' as core_exceptions;
import '../../domain/entities/ai_provider.dart';

abstract class ChatRemoteDataSource {
  Stream<String> streamChatCompletion({
    required List<Map<String, String>> conversationHistory,
  });
}

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  final String apiKey;
  final AIProvider provider;
  final http.Client httpClient;
  final Uri ollamaBaseUri;

  GenerativeModel? _geminiModel;

  ChatRemoteDataSourceImpl({
    required this.apiKey,
    required this.provider,
    required this.httpClient,
    Uri? ollamaBaseUri,
  })  : ollamaBaseUri = ollamaBaseUri ?? Uri.parse('http://localhost:11434') {
    if (provider == AIProvider.gemini) {
      _geminiModel = GenerativeModel(
        model: 'gemini-1.5-flash-latest',
        apiKey: apiKey,
      );
    }
  }

  @override
  Stream<String> streamChatCompletion({
    required List<Map<String, String>> conversationHistory,
  }) async* {
    try {
      switch (provider) {
        case AIProvider.openAI:
          yield* _streamWithOpenAI(conversationHistory);
          break;
        case AIProvider.xAI:
          yield* _streamWithXAI(conversationHistory);
          break;
        case AIProvider.gemini:
          yield* _streamWithGemini(conversationHistory);
          break;
        case AIProvider.ollama:
          yield* _streamWithOllama(conversationHistory);
          break;
        case AIProvider.claude:
          yield* _streamWithClaude(conversationHistory);
          break;
        case AIProvider.mistral:
          yield* _streamWithMistral(conversationHistory);
          break;
        case AIProvider.deepSeek:
          yield* _streamWithDeepSeek(conversationHistory);
          break;
      }
    } on core_exceptions.ServerException {
      rethrow;
    } on SocketException catch (error) {
      throw core_exceptions.NetworkException(error.message);
    } on http.ClientException catch (error) {
      throw core_exceptions.NetworkException(error.message);
    } catch (error) {
      throw core_exceptions.ServerException(error.toString());
    }
  }

  Stream<String> _streamWithOpenAI(
      List<Map<String, String>> conversationHistory) async* {
    final url = Uri.parse('https://api.openai.com/v1/chat/completions');
    final request = http.Request('POST', url)
      ..headers.addAll({
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      })
      ..body = jsonEncode({
        'model': 'gpt-3.5-turbo',
        'messages': conversationHistory,
        'temperature': 0.7,
        'stream': true,
      });

    final response = await httpClient.send(request);
    if (response.statusCode != 200) {
      final body = await response.stream.bytesToString();
      throw core_exceptions.ServerException('OpenAI error (${response.statusCode}): $body');
    }

    final lines =
        response.stream.transform(utf8.decoder).transform(const LineSplitter());

    await for (final line in lines) {
      if (line.trim() == '[DONE]') break;
      if (line.startsWith('data: ')) {
        final data = jsonDecode(line.substring(6)) as Map<String, dynamic>;
        final delta = data['choices'][0]['delta']['content'];
        if (delta != null) yield delta as String;
      }
    }
  }

  Stream<String> _streamWithXAI(
      List<Map<String, String>> conversationHistory) async* {
    final url = Uri.parse('https://api.x.ai/v1/chat/completions');
    final filtered = conversationHistory
        .where((message) => (message['content'] ?? '').trim().isNotEmpty)
        .toList();

    final request = http.Request('POST', url)
      ..headers.addAll({
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      })
      ..body = jsonEncode({
        'model': 'grok-2-latest',
        'messages': filtered,
        'temperature': 0.7,
        'stream': true,
      });

    final response = await httpClient.send(request);
    if (response.statusCode != 200) {
      final body = await response.stream.bytesToString();
      throw core_exceptions.ServerException('xAI error (${response.statusCode}): $body');
    }

    final lines =
        response.stream.transform(utf8.decoder).transform(const LineSplitter());

    await for (final line in lines) {
      if (line.trim() == '[DONE]') break;
      if (line.startsWith('data: ')) {
        final data = jsonDecode(line.substring(6)) as Map<String, dynamic>;
        final delta = data['choices'][0]['delta']['content'];
        if (delta != null) yield delta as String;
      }
    }
  }

  Stream<String> _streamWithGemini(
      List<Map<String, String>> conversationHistory) async* {
    if (_geminiModel == null) {
      throw core_exceptions.ServerException('Gemini model not initialised');
    }

    final content = conversationHistory
        .map((message) => Content.text(message['content'] ?? ''))
        .toList(growable: false);

    final stream = _geminiModel!.generateContentStream(
      content,
      generationConfig: GenerationConfig(
        temperature: 0.7,
        maxOutputTokens: 150,
      ),
    );

    await for (final chunk in stream) {
      final text = chunk.text;
      if (text != null) yield text;
    }
  }

  Stream<String> _streamWithOllama(
      List<Map<String, String>> conversationHistory) async* {
    final url = ollamaBaseUri.replace(path: '/api/chat');
    final request = http.Request('POST', url)
      ..headers.addAll({'Content-Type': 'application/json'})
      ..body = jsonEncode({
        'model': 'llama3',
        'stream': true,
        'messages': conversationHistory,
      });

    final response = await httpClient.send(request);
    if (response.statusCode != 200) {
      throw core_exceptions.ServerException('Ollama request failed: ${response.statusCode}');
    }

    final lines =
        response.stream.transform(utf8.decoder).transform(const LineSplitter());

    await for (final line in lines) {
      if (line.trim().isEmpty) continue;
      final data = jsonDecode(line) as Map<String, dynamic>;
      if (data['done'] == true) break;
      final content = data['message']?['content'];
      if (content != null) yield content as String;
    }
  }

  Stream<String> _streamWithClaude(
      List<Map<String, String>> conversationHistory) async* {
    final url = Uri.parse('https://api.anthropic.com/v1/messages');
    final request = http.Request('POST', url)
      ..headers.addAll({
        'Content-Type': 'application/json',
        'x-api-key': apiKey,
        'anthropic-version': '2023-06-01',
      })
      ..body = jsonEncode({
        'model': 'claude-3-opus-20240229',
        'messages': conversationHistory,
        'max_tokens': 1024,
        'temperature': 0.7,
        'stream': true,
      });

    final response = await httpClient.send(request);
    if (response.statusCode != 200) {
      throw core_exceptions.ServerException('Claude request failed: ${response.statusCode}');
    }

    final lines =
        response.stream.transform(utf8.decoder).transform(const LineSplitter());

    await for (final line in lines) {
      if (line.startsWith('event:')) continue;
      if (line.startsWith('data: ')) {
        final payload = jsonDecode(line.substring(6)) as Map<String, dynamic>;
        final content = payload['delta']?['text'];
        if (content != null && (content as String).isNotEmpty) {
          yield content;
        }
      }
    }
  }

  Stream<String> _streamWithMistral(
      List<Map<String, String>> conversationHistory) async* {
    final url = Uri.parse('https://api.mistral.ai/v1/chat/completions');
    final request = http.Request('POST', url)
      ..headers.addAll({
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      })
      ..body = jsonEncode({
        'model': 'mistral-large-latest',
        'messages': conversationHistory,
        'temperature': 0.7,
        'stream': true,
      });

    final response = await httpClient.send(request);
    if (response.statusCode != 200) {
      throw core_exceptions.ServerException('Mistral request failed: ${response.statusCode}');
    }

    final lines =
        response.stream.transform(utf8.decoder).transform(const LineSplitter());

    await for (final line in lines) {
      if (line.trim() == '[DONE]') break;
      if (line.startsWith('data: ')) {
        final data = jsonDecode(line.substring(6)) as Map<String, dynamic>;
        final delta = data['choices'][0]['delta']['content'];
        if (delta != null) yield delta as String;
      }
    }
  }

  Stream<String> _streamWithDeepSeek(
      List<Map<String, String>> conversationHistory) async* {
    final url = Uri.parse('https://api.deepseek.com/chat/completions');
    final request = http.Request('POST', url)
      ..headers.addAll({
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      })
      ..body = jsonEncode({
        'model': 'deepseek-chat',
        'messages': conversationHistory,
        'temperature': 0.7,
        'stream': true,
      });

    final response = await httpClient.send(request);
    if (response.statusCode != 200) {
      final body = await response.stream.bytesToString();
      throw core_exceptions.ServerException('DeepSeek request failed: ${response.statusCode} - $body');
    }

    final lines =
        response.stream.transform(utf8.decoder).transform(const LineSplitter());

    await for (final line in lines) {
      if (line.trim() == '[DONE]') break;
      if (line.startsWith('data: ')) {
        final data = jsonDecode(line.substring(6)) as Map<String, dynamic>;
        final delta = data['choices'][0]['delta']['content'];
        if (delta != null) yield delta as String;
      }
    }
  }
}
