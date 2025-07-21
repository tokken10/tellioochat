import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/message.dart';
import '../../services/chat_ai_service.dart';
import 'chat_event.dart';
import 'chat_state.dart';


mixin ChatBlocHandlers on Bloc<ChatEvent, ChatState> {
  // Dependencies wired in from ChatBloc -------------------------------------------------
  //ChatRepository get chatRepository;
  ChatAIService get chatAIService;
  bool get cancelTyping;
  set cancelTyping(bool value);
  int? get currentSessionKey;
  set currentSessionKey(int? key);


  // ====================================================================================
  // 1.  Shared AI‑streaming helper
  // ====================================================================================
  Future<void> _handleStreamingAIResponse({
    required Emitter<ChatState> emit,
    required List<Message> initialMessages,
    required Stream<String> stream,
  }) async {
    var updatedMessages = List<Message>.from(initialMessages);
    var updatedConversation = List<Message>.from(initialMessages);
    var buffer = '';

    await for (final chunk in stream) {
      if (cancelTyping) break;
      buffer += chunk;

      final ai = Message(finalContent: buffer, isSentByUser: false);
      updatedMessages[updatedMessages.length - 1] = ai;
      updatedConversation[updatedConversation.length - 1] = ai;

      emit(ChatLoaded(
        messages: List.from(updatedMessages),
        currentConversation: List.from(updatedConversation),
        isGeneratingResponse: false,
        isTyping: true,
      ));
    }

    emit(ChatLoaded(
      messages: updatedMessages,
      currentConversation: updatedConversation,
      isTyping: false,
    ));

  }

  // ====================================================================================
  // 2.  Helper to emit an error placeholder
  // ====================================================================================
  void _emitErrorMessage(
      Emitter<ChatState> emit, List<Message> msgs, String error) {
    msgs[msgs.length - 1] = Message(finalContent: error, isSentByUser: false);
    emit(ChatLoaded(
      messages: msgs,
      currentConversation: msgs,
      isTyping: false,
    ));
  }

  // ====================================================================================
  // 3.  Handlers
  // ====================================================================================

  // --------------------------- onSendMessage ------------------------------------------
  Future<void> onSendMessage(
      SendMessage event, Emitter<ChatState> emit) async {
    if (state is! ChatLoaded) return;
    cancelTyping = false;

    final current = state as ChatLoaded;
    final user = Message(finalContent: event.content, isSentByUser: true);
    final ai = Message(finalContent: '', isSentByUser: false);
    final updated = [...current.messages, user, ai];

    emit(current.copyWith(
      messages: updated,
      currentConversation: [...current.currentConversation, user, ai],
      isGeneratingResponse: true,
    ));

    try {
      final stream = chatAIService.getAIResponseStream(
        messages: updated,
        systemRoleContent: 'Keep responses engaging and helpful.',
      );
      await _handleStreamingAIResponse(
        emit: emit,
        initialMessages: updated,
        stream: stream,
      );
    } catch (_) {
      _emitErrorMessage(
          emit, updated, 'Something went wrong while generating the response.');
    }
  }


  // --------------------------- onExecutePrompt ---------------------------------------
  Future<void> onExecutePrompt(
      ExecutePrompt event, Emitter<ChatState> emit) async {
    cancelTyping = true;
    await Future.delayed(const Duration(milliseconds: 100));
    cancelTyping = false;

    final user = Message(finalContent: event.prompt, isSentByUser: true);
    final ai = Message(finalContent: '', isSentByUser: false);
    final msgs = [user, ai];

    emit(ChatLoaded(
      messages: msgs,
      currentConversation: msgs,
      isGeneratingResponse: true,
    ));

    currentSessionKey = null;

    try {
      final stream = chatAIService.getAIResponseStream(
        messages: msgs,
        systemRoleContent:
        'You are a friendly and engaging AI assistant.',
      );
      await _handleStreamingAIResponse(
        emit: emit,
        initialMessages: msgs,
        stream: stream,
      );
    } catch (_) {
      _emitErrorMessage(
          emit, msgs, 'Something went wrong while executing the prompt.');
    }
  }


  // --------------------------- Messaging functions --------------------------------------

  void onResetCurrentConversation(ResetCurrentConversation event, Emitter<ChatState> emit) {
    if (state is! ChatLoaded) return;
    if (!event.keepSession) currentSessionKey = null;
    emit((state as ChatLoaded).copyWith(messages: [], currentConversation: []));
  }


  Future<void> onStopGenerating(StopGenerating event, Emitter<ChatState> emit) async {
    cancelTyping = true;
    if (state is! ChatLoaded) return;
    emit((state as ChatLoaded).copyWith(isTyping: false, isGeneratingResponse: false));
  }


}
