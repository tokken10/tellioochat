import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/chat_message.dart';
import '../repositories/chat_repository.dart';

class StreamChatCompletion
    implements StreamUseCase<ChatMessage, StreamChatParams> {
  final ChatRepository repository;

  StreamChatCompletion(this.repository);

  @override
  Stream<Either<Failure, ChatMessage>> call(StreamChatParams params) {
    return repository.streamChatCompletion(
      messages: params.messages,
      systemPrompt: params.systemPrompt,
    );
  }
}

class StreamChatParams {
  final List<ChatMessage> messages;
  final String systemPrompt;

  const StreamChatParams({
    required this.messages,
    required this.systemPrompt,
  });
}
