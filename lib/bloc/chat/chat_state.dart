// chat_state.dart
import 'package:equatable/equatable.dart';
import '../../models/message.dart';

/// Base class for all chat states
abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

/// Initial state of the chat
class ChatInitial extends ChatState {
  const ChatInitial();
}

/// State representing the chat with loaded messages and UI status
class ChatLoaded extends ChatState {
  /// All chat messages (entire history)
  final List<Message> messages;

  /// Only the messages for the active conversation (cleared when opening chat)
  final List<Message> currentConversation;

  /// UI Status Flags
  final bool isGeneratingResponse;
  final bool isTyping;


  const ChatLoaded({
    required this.messages,
    required this.currentConversation,
    this.isGeneratingResponse = false,
    this.isTyping = false,
  });

  /// Copy this state with updated properties
  ChatLoaded copyWith({
    List<Message>? messages,
    List<Message>? currentConversation,
    bool? isGeneratingResponse,
    bool? isTyping,
  }) {
    return ChatLoaded(
      messages: messages ?? this.messages,
      currentConversation: currentConversation ?? this.currentConversation,
      isGeneratingResponse: isGeneratingResponse ?? this.isGeneratingResponse,
      isTyping: isTyping ?? this.isTyping,
    );
  }

  @override
  List<Object> get props => [
    messages,
    currentConversation,
    isGeneratingResponse,
    isTyping,
  ];
}

/// State representing an error state in the chat
class ChatError extends ChatState {
  final String errorMessage;

  const ChatError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}


