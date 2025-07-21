// chat_event.dart
import 'package:equatable/equatable.dart';

/// Base class for all chat events
abstract class ChatEvent extends Equatable {
  const ChatEvent();
  @override
  List<Object> get props => [];
}

/// Event triggered when the user sends a message
class SendMessage extends ChatEvent {
  final String content;

  const SendMessage(this.content);

  @override
  List<Object> get props => [content];
}


/// Event triggered to execute a specific prompt
class ExecutePrompt extends ChatEvent {
  final String prompt;

  const ExecutePrompt(this.prompt);

  @override
  List<Object> get props => [prompt];
}

/// Event triggered to reset only the **current conversation**
class ResetCurrentConversation extends ChatEvent {
  final bool keepSession;
  const ResetCurrentConversation({this.keepSession = false});
}


class StopGenerating extends ChatEvent {
  const StopGenerating();
}
