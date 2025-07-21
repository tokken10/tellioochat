import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_generative_ai/google_generative_ai.dart';

/// Enum to specify which AI provider to use
/// ─────────────────────────────────────────
/// Add new providers here as you enable them.
enum AIProvider {
  OpenAI,
  xAI,
  Gemini,
  Ollama,
  Claude,
  Mistral,
  DeepSeek,
}

/// A repository that abstracts over multiple AI providers
/// and exposes a unified streaming interface to generate text.
///
/// ⚠️  All provider implementations are intentionally *very* thin:
///     • (`_streamWith…`) contains a small amount of provider‑specific glue.
///     • The public API is the single `generateResponseStream` method.
///     • Each stream yields already‑decoded UTF‑8 String chunks so the UI
///       can pipe them straight into your chat BLoC.
///
/// Feel free to split each provider into its own file if this grows.
class AIRepository {
  final String apiKey;               // Key for providers that need it
  final AIProvider aiProvider;

  // Gemini’s client is heavier so we lazily create it only when needed.
  final GenerativeModel? _geminiModel;

  AIRepository({
    required this.apiKey,
    this.aiProvider = AIProvider.OpenAI,
  }) : _geminiModel = aiProvider == AIProvider.Gemini
      ? GenerativeModel(
    model: 'gemini-1.5-flash-latest',
    apiKey: apiKey,
  )
      : null;

  /// Unified streaming entry‑point.
  Stream<String> generateResponseStream(
      List<Map<String, String>> conversationHistory) async* {
    switch (aiProvider) {
      case AIProvider.OpenAI:
        yield* _streamWithOpenAI(conversationHistory);
        break;
      case AIProvider.xAI:
        yield* _streamWithXAI(conversationHistory);
        break;
      case AIProvider.Gemini:
        yield* _streamWithGemini(conversationHistory);
        break;
      case AIProvider.Ollama:
        yield* _streamWithOllama(conversationHistory);
        break;
      case AIProvider.Claude:
        yield* _streamWithClaude(conversationHistory);
        break;
      case AIProvider.Mistral:
        yield* _streamWithMistral(conversationHistory);
        break;
      case AIProvider.DeepSeek:
        yield* _streamWithDeepSeek(conversationHistory);
        break;
    }
  }

  //─────────────────────────────────────────────────────────────────────────────
  // PROVIDER IMPLEMENTATIONS
  //─────────────────────────────────────────────────────────────────────────────

  /// 🔹 OpenAI (GPT‑3.5 / GPT‑4)
  Stream<String> _streamWithOpenAI(
      List<Map<String, String>> conversationHistory) async* {
    final url = Uri.parse('https://api.openai.com/v1/chat/completions');
    final req = http.Request('POST', url)
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

    final res = await req.send();
    if (res.statusCode != 200) {
      throw Exception('OpenAI request failed: ${res.statusCode}');
    }

    final lines =
    res.stream.transform(utf8.decoder).transform(const LineSplitter());

    await for (final line in lines) {
      if (line.trim() == '[DONE]') break;
      if (line.startsWith('data: ')) {
        final jsonStr = line.substring(6);
        try {
          final jsonData = jsonDecode(jsonStr);
          final delta = jsonData['choices'][0]['delta']['content'];
          if (delta != null) yield delta;
        } catch (_) {
          /* swallow malformed chunks */
        }
      }
    }
  }

  /// 🔹 xAI (Grok)
  Stream<String> _streamWithXAI(
      List<Map<String, String>> conversationHistory) async* {
    final url = Uri.parse('https://api.x.ai/v1/chat/completions');
    final filtered = conversationHistory
        .where((m) => (m['content'] ?? '').trim().isNotEmpty)
        .toList();

    final req = http.Request('POST', url)
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

    final res = await req.send();
    if (res.statusCode != 200) {
      final body = await res.stream.bytesToString();
      throw Exception('xAI error (${res.statusCode}): $body');
    }

    final lines =
    res.stream.transform(utf8.decoder).transform(const LineSplitter());

    await for (final line in lines) {
      if (line.trim() == '[DONE]') break;
      if (line.startsWith('data: ')) {
        final jsonStr = line.substring(6);
        try {
          final delta = jsonDecode(jsonStr)['choices'][0]['delta']['content'];
          if (delta != null) yield delta;
        } catch (_) {/* ignore */}
      }
    }
  }

  /// 🔹 Gemini
  Stream<String> _streamWithGemini(
      List<Map<String, String>> conversationHistory) async* {
    if (_geminiModel == null) {
      throw Exception('Gemini model not initialised');
    }
    final content = conversationHistory
        .map((m) => Content.text(m['content']!))
        .toList(growable: false);

    final stream = _geminiModel!.generateContentStream(
      content,
      generationConfig: GenerationConfig(
        temperature: 0.7,
        maxOutputTokens: 150,
      ),
    );

    await for (final chunk in stream) {
      if (chunk.text != null) yield chunk.text!;
    }
  }



  /// 🔹 Ollama (local‑hosted / self‑hosted)
  ///
  /// ➜ Expects Ollama to be running on `http://localhost:11434`.
  ///    If you reverse‑proxy or host remotely, adjust the URL below.
  /// ➜ Ollama’s SSE chunks are *raw JSON lines* (no `data:` prefix).
  Stream<String> _streamWithOllama(
      List<Map<String, String>> conversationHistory) async* {
    final url = Uri.parse('http://localhost:11434/api/chat');
    final req = http.Request('POST', url)
      ..headers.addAll({'Content-Type': 'application/json'})
      ..body = jsonEncode({
        'model': 'llama3', // change to whichever model you pulled
        'stream': true,
        'messages': conversationHistory,
      });

    final res = await req.send();
    if (res.statusCode != 200) {
      throw Exception('Ollama request failed: ${res.statusCode}');
    }

    final lines =
    res.stream.transform(utf8.decoder).transform(const LineSplitter());

    await for (final line in lines) {
      if (line.trim().isEmpty) continue;
      final data = jsonDecode(line);
      if (data['done'] == true) break;
      final content = data['message']?['content'];
      if (content != null) yield content;
    }
  }

  /// 🔹 Claude 3 (Anthropic)
  ///
  /// Claude’s event stream looks like:
  ///     event: message_start\n
  ///     data: {...}\n\n
  /// We ignore the `event:` lines and parse only `data:` payloads.
  Stream<String> _streamWithClaude(
      List<Map<String, String>> conversationHistory) async* {
    final url = Uri.parse('https://api.anthropic.com/v1/messages');
    final req = http.Request('POST', url)
      ..headers.addAll({
        'Content-Type': 'application/json',
        'x-api-key': apiKey,
        'anthropic-version': '2023-06-01',
      })
      ..body = jsonEncode({
        'model': 'claude-3-opus-20240229', // or sonnet, haiku, etc.
        'messages': conversationHistory,
        'max_tokens': 1024,
        'temperature': 0.7,
        'stream': true,
      });

    final res = await req.send();
    if (res.statusCode != 200) {
      throw Exception('Claude request failed: ${res.statusCode}');
    }

    final lines =
    res.stream.transform(utf8.decoder).transform(const LineSplitter());

    await for (final line in lines) {
      if (line.startsWith('event:')) continue; // not needed
      if (line.startsWith('data: ')) {
        final payload = jsonDecode(line.substring(6));
        final content = payload['delta']?['text'];
        if (content != null && content.isNotEmpty) yield content;
      }
    }
  }

  /// 🔹 Mistral AI
  ///
  /// Shares the exact SSE format with the OpenAI endpoint,
  /// so we reuse almost the same parser.
  Stream<String> _streamWithMistral(
      List<Map<String, String>> conversationHistory) async* {
    final url = Uri.parse('https://api.mistral.ai/v1/chat/completions');
    final req = http.Request('POST', url)
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

    final res = await req.send();
    if (res.statusCode != 200) {
      throw Exception('Mistral request failed: ${res.statusCode}');
    }

    final lines =
    res.stream.transform(utf8.decoder).transform(const LineSplitter());

    await for (final line in lines) {
      if (line.trim() == '[DONE]') break;
      if (line.startsWith('data: ')) {
        final data = jsonDecode(line.substring(6));
        final delta = data['choices'][0]['delta']['content'];
        if (delta != null) yield delta;
      }
    }
  }

  /// 🔹 DeepSeek
  ///
  /// DeepSeek’s API is *OpenAI‑compatible*, so the code is virtually identical
  /// to the OpenAI implementation – we only swap the base URL.
  Stream<String> _streamWithDeepSeek(
      List<Map<String, String>> conversationHistory) async* {
    final url = Uri.parse('https://api.deepseek.com/chat/completions');
    final req = http.Request('POST', url)
      ..headers.addAll({
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      })
      ..body = jsonEncode({
        'model': 'deepseek-chat', // or deepseek-coder, etc.
        'messages': conversationHistory,
        'temperature': 0.7,
        'stream': true,
      });

    final res = await req.send();
    if (res.statusCode != 200) {
      throw Exception('DeepSeek request failed: ${res.statusCode}');
    }

    final lines =
    res.stream.transform(utf8.decoder).transform(const LineSplitter());

    await for (final line in lines) {
      if (line.trim() == '[DONE]') break;
      if (line.startsWith('data: ')) {
        final data = jsonDecode(line.substring(6));
        final delta = data['choices'][0]['delta']['content'];
        if (delta != null) yield delta;
      }
    }
  }
}