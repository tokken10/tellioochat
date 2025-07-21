import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/chat/chat_bloc.dart';
import '../constants/constants.dart';
import '../repositories/ai_repository.dart';
import '../services/chat_ai_service.dart';

/// Returns a list of BlocProviders needed to run the app.
List<BlocProvider> getBlocProviders() {
  // Define the currently selected AI provider manually .
  final selectedProvider = AIProvider.xAI;

  // Create the AIRepository using the appropriate API key and provider.
  final aiRepository = AIRepository(
    apiKey: getApiKeyForProvider(selectedProvider),
    aiProvider: selectedProvider,
  );

  // Initialize the ChatAIService with the AIRepository.
  final chatAIService = ChatAIService(aiRepository);


  // Return a list of BLoC providers.
  return [
    BlocProvider<ChatBloc>(
      create: (_) => ChatBloc(
        chatAIService: chatAIService,
      ),
    ),
  ];
}


/// Helper function to return the API key based on the selected provider.
String getApiKeyForProvider(AIProvider provider) {
  switch (provider) {
    case AIProvider.OpenAI:
      return openAiApiKey;
    case AIProvider.xAI:
      return xaiApiKey;
    case AIProvider.Gemini:
      return geminiApiKey;
    case AIProvider.Ollama:
      return ollamaApiKey;
    case AIProvider.Claude:
      return claudeApiKey;
    case AIProvider.Mistral:
      return mistralApiKey;
    case AIProvider.DeepSeek:
      return deepSeekApiKey;
  }
}