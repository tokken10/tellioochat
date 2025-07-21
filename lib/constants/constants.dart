import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Load all possible API keys depending on build mode
final String openAiApiKey = kReleaseMode
    ? const String.fromEnvironment('OPENAI_API_KEY')
    : dotenv.env['OPENAI_API_KEY'] ?? '';

final String xaiApiKey = kReleaseMode
    ? const String.fromEnvironment('XAI_API_KEY')
    : dotenv.env['XAI_API_KEY'] ?? '';

final String geminiApiKey = kReleaseMode
    ? const String.fromEnvironment('GEMINI_API_KEY')
    : dotenv.env['GEMINI_API_KEY'] ?? '';

final String ollamaApiKey = kReleaseMode
    ? const String.fromEnvironment('OLLAMA_API_KEY')
    : dotenv.env['OLLAMA_API_KEY'] ?? '';

final String claudeApiKey = kReleaseMode
    ? const String.fromEnvironment('CLAUDE_API_KEY')
    : dotenv.env['CLAUDE_API_KEY'] ?? '';

final String mistralApiKey = kReleaseMode
    ? const String.fromEnvironment('MISTRAL_API_KEY')
    : dotenv.env['MISTRAL_API_KEY'] ?? '';

final String deepSeekApiKey = kReleaseMode
    ? const String.fromEnvironment('DEEPSEEK_API_KEY')
    : dotenv.env['DEEPSEEK_API_KEY'] ?? '';