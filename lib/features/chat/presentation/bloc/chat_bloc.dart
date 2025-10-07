import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/chat_message.dart';
import '../../domain/usecases/stream_chat_completion.dart';
import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final StreamChatCompletion streamChatCompletion;
  final String chatSystemPrompt;
  final String promptSystemPrompt;

  StreamSubscription<Either<Failure, ChatMessage>>? _subscription;
  final List<ChatMessage> _conversation = [];

  ChatBloc({
    required this.streamChatCompletion,
    this.chatSystemPrompt = 'Keep responses engaging and helpful.',
    this.promptSystemPrompt = 'You are a friendly and engaging AI assistant.',
  }) : super(const ChatState.initial()) {
    on<ChatEvent>((event, emit) async {
      await event.map(
        sendMessage: (value) => _handleSendMessage(value.content, emit),
        executePrompt: (value) => _handleExecutePrompt(value.prompt, emit),
        resetConversation: (value) => _handleResetConversation(value.keepSession, emit),
        stopGeneration: (_) => _handleStopGeneration(emit),
        streamUpdate: (value) => _handleStreamUpdate(value.result, emit),
        streamCompleted: (_) => _handleStreamCompleted(emit),
      );
    });
  }

  Future<void> _handleSendMessage(
    String content,
    Emitter<ChatState> emit,
  ) async {
    final trimmed = content.trim();
    if (trimmed.isEmpty) return;

    await _cancelStreaming();

    _conversation
      ..add(ChatMessage(content: trimmed, isUserMessage: true))
      ..add(const ChatMessage(content: '', isUserMessage: false));

    emit(ChatState.loading(
      messages: _snapshot(),
      currentConversation: _snapshot(),
    ));

    _subscription = streamChatCompletion(
      StreamChatParams(
        messages: _snapshot(),
        systemPrompt: chatSystemPrompt,
      ),
    ).listen(
      (result) => add(ChatEvent.streamUpdate(result)),
      onDone: () => add(const ChatEvent.streamCompleted()),
    );
  }

  Future<void> _handleExecutePrompt(
    String prompt,
    Emitter<ChatState> emit,
  ) async {
    final trimmed = prompt.trim();
    if (trimmed.isEmpty) return;

    await _cancelStreaming();
    _conversation
      ..clear()
      ..add(ChatMessage(content: trimmed, isUserMessage: true))
      ..add(const ChatMessage(content: '', isUserMessage: false));

    emit(ChatState.loading(
      messages: _snapshot(),
      currentConversation: _snapshot(),
    ));

    _subscription = streamChatCompletion(
      StreamChatParams(
        messages: _snapshot(),
        systemPrompt: promptSystemPrompt,
      ),
    ).listen(
      (result) => add(ChatEvent.streamUpdate(result)),
      onDone: () => add(const ChatEvent.streamCompleted()),
    );
  }

  Future<void> _handleResetConversation(
    bool keepSession,
    Emitter<ChatState> emit,
  ) async {
    await _cancelStreaming();
    _conversation.clear();
    emit(const ChatState.success(
      messages: <ChatMessage>[],
      currentConversation: <ChatMessage>[],
      isStreaming: false,
    ));
  }

  Future<void> _handleStopGeneration(
    Emitter<ChatState> emit,
  ) async {
    await _cancelStreaming();
    emit(ChatState.success(
      messages: _snapshot(),
      currentConversation: _snapshot(),
      isStreaming: false,
    ));
  }

  Future<void> _handleStreamUpdate(
    Either<Failure, ChatMessage> result,
    Emitter<ChatState> emit,
  ) async {
    await result.fold<Future<void>>(
      (failure) async {
        final index = _lastAssistantIndex();
        final hasContent = index != -1 &&
            _conversation[index].content.trim().isNotEmpty;

        if (!hasContent) {
          _replaceLatestAssistantMessage(
            ChatMessage(content: failure.message, isUserMessage: false),
          );
        }

        emit(ChatState.failure(
          failure: failure,
          messages: _snapshot(),
          currentConversation: _snapshot(),
        ));
        await _cancelStreaming();
      },
      (message) async {
        _replaceLatestAssistantMessage(message);
        emit(ChatState.success(
          messages: _snapshot(),
          currentConversation: _snapshot(),
          isStreaming: true,
        ));
      },
    );
  }

  Future<void> _handleStreamCompleted(
    Emitter<ChatState> emit,
  ) async {
    emit(ChatState.success(
      messages: _snapshot(),
      currentConversation: _snapshot(),
      isStreaming: false,
    ));
  }

  Future<void> _cancelStreaming() async {
    await _subscription?.cancel();
    _subscription = null;
  }

  void _replaceLatestAssistantMessage(ChatMessage message) {
    final index = _lastAssistantIndex();
    if (index == -1) {
      _conversation.add(message);
    } else {
      _conversation[index] = message;
    }
  }

  int _lastAssistantIndex() {
    return _conversation.lastIndexWhere((m) => !m.isUserMessage);
  }

  List<ChatMessage> _snapshot() => List<ChatMessage>.unmodifiable(_conversation);

  @override
  Future<void> close() async {
    await _cancelStreaming();
    return super.close();
  }
}
