// chat_ai_service.dart
import '../models/message.dart';
import '../repositories/ai_repository.dart';

class ChatAIService {
  final AIRepository _aiRepository;

  ChatAIService(this._aiRepository);

  /// Formats messages and gets response stream from the AI
  Stream<String> getAIResponseStream({
    required List<Message> messages,
    required String systemRoleContent,
  }) {
    final List<Map<String, String>> formattedHistory = [
      {"role": "system", "content": systemRoleContent},
      ...messages.map((msg) => {
        "role": msg.isSentByUser ? "user" : "assistant",
        "content": msg.finalContent,
      }),
    ];

    return _aiRepository.generateResponseStream(formattedHistory);
  }
}