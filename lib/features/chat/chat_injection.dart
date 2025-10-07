import 'package:get_it/get_it.dart';

import '../../core/constants/api_keys.dart';
import '../../core/network/network_info.dart';
import 'data/datasources/chat_remote_data_source.dart';
import 'data/repositories/chat_repository_impl.dart';
import 'domain/entities/ai_provider.dart';
import 'domain/repositories/chat_repository.dart';
import 'domain/usecases/stream_chat_completion.dart';
import 'presentation/bloc/chat_bloc.dart';

class ChatFeatureConfig {
  final AIProvider provider;
  final String chatSystemPrompt;
  final String promptSystemPrompt;

  const ChatFeatureConfig({
    required this.provider,
    required this.chatSystemPrompt,
    required this.promptSystemPrompt,
  });

  String get apiKey {
    switch (provider) {
      case AIProvider.openAI:
        return openAiApiKey;
      case AIProvider.xAI:
        return xaiApiKey;
      case AIProvider.gemini:
        return geminiApiKey;
      case AIProvider.ollama:
        return ollamaApiKey;
      case AIProvider.claude:
        return claudeApiKey;
      case AIProvider.mistral:
        return mistralApiKey;
      case AIProvider.deepSeek:
        return deepSeekApiKey;
    }
  }
}

Future<void> registerChatFeatureDependencies(GetIt getIt) async {
  const config = ChatFeatureConfig(
    provider: AIProvider.xAI,
    chatSystemPrompt: 'Keep responses engaging and helpful.',
    promptSystemPrompt: 'You are a friendly and engaging AI assistant.',
  );

  getIt.registerSingleton<ChatFeatureConfig>(config);

  getIt.registerLazySingleton<ChatRemoteDataSource>(
    () => ChatRemoteDataSourceImpl(
      apiKey: config.apiKey,
      provider: config.provider,
      httpClient: getIt(),
    ),
  );

  getIt.registerLazySingleton<ChatRepository>(
    () => ChatRepositoryImpl(
      remoteDataSource: getIt(),
      networkInfo: getIt<NetworkInfo>(),
    ),
  );

  getIt.registerLazySingleton<StreamChatCompletion>(
    () => StreamChatCompletion(getIt()),
  );

  getIt.registerFactory(
    () => ChatBloc(
      streamChatCompletion: getIt(),
      chatSystemPrompt: config.chatSystemPrompt,
      promptSystemPrompt: config.promptSystemPrompt,
    ),
  );
}
