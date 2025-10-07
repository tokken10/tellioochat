import '../../domain/entities/chat_message.dart';

class ChatMessageModel extends ChatMessage {
  const ChatMessageModel({
    required super.content,
    required super.isUserMessage,
    super.hasAudio,
  });

  factory ChatMessageModel.fromEntity(ChatMessage message) {
    return ChatMessageModel(
      content: message.content,
      isUserMessage: message.isUserMessage,
      hasAudio: message.hasAudio,
    );
  }

  ChatMessage toEntity() {
    return ChatMessage(
      content: content,
      isUserMessage: isUserMessage,
      hasAudio: hasAudio,
    );
  }

  Map<String, String> toRemotePayload() {
    return {
      'role': isUserMessage ? 'user' : 'assistant',
      'content': content,
    };
  }
}
