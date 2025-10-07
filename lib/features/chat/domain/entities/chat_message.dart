import 'package:equatable/equatable.dart';

class ChatMessage extends Equatable {
  final String content;
  final bool isUserMessage;
  final bool hasAudio;

  const ChatMessage({
    required this.content,
    required this.isUserMessage,
    this.hasAudio = false,
  });

  ChatMessage copyWith({
    String? content,
    bool? isUserMessage,
    bool? hasAudio,
  }) {
    return ChatMessage(
      content: content ?? this.content,
      isUserMessage: isUserMessage ?? this.isUserMessage,
      hasAudio: hasAudio ?? this.hasAudio,
    );
  }

  @override
  List<Object?> get props => [content, isUserMessage, hasAudio];
}
