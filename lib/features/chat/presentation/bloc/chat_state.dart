import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/chat_message.dart';

part 'chat_state.freezed.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState.initial() = _Initial;

  const factory ChatState.loading({
    @Default(<ChatMessage>[]) List<ChatMessage> messages,
    @Default(<ChatMessage>[]) List<ChatMessage> currentConversation,
  }) = _Loading;

  const factory ChatState.success({
    required List<ChatMessage> messages,
    required List<ChatMessage> currentConversation,
    @Default(false) bool isStreaming,
  }) = _Success;

  const factory ChatState.failure({
    required Failure failure,
    @Default(<ChatMessage>[]) List<ChatMessage> messages,
    @Default(<ChatMessage>[]) List<ChatMessage> currentConversation,
  }) = _Failure;
}
