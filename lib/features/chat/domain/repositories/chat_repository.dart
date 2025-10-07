import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/chat_message.dart';

abstract class ChatRepository {
  Stream<Either<Failure, ChatMessage>> streamChatCompletion({
    required List<ChatMessage> messages,
    required String systemPrompt,
  });
}
