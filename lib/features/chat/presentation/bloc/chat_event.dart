import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/chat_message.dart';

part 'chat_event.freezed.dart';

@freezed
class ChatEvent with _$ChatEvent {
  const factory ChatEvent.sendMessage(String content) = _SendMessage;
  const factory ChatEvent.executePrompt(String prompt) = _ExecutePrompt;
  const factory ChatEvent.resetConversation({@Default(false) bool keepSession}) = _ResetConversation;
  const factory ChatEvent.stopGeneration() = _StopGeneration;
  const factory ChatEvent.streamUpdate(Either<Failure, ChatMessage> result) = _StreamUpdate;
  const factory ChatEvent.streamCompleted() = _StreamCompleted;
}
