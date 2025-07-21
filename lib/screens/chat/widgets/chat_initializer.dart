import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tellioo/bloc/chat/chat_bloc.dart';
import 'package:tellioo/bloc/chat/chat_event.dart';
import 'package:tellioo/screens/chat/chat_screen.dart';

/// Initializes the chat experience
void initializeChat(
    BuildContext context,
    ChatScreen widget,
    FocusNode focusNode,
    ) {
  final chatBloc = context.read<ChatBloc>();

  // Set session key if one is provided (optional)
  chatBloc.currentSessionKey = widget.sessionKey;

  // Always start with a clean conversation
  chatBloc.add(ResetCurrentConversation(keepSession: true));

  // Focus the input field
  if (widget.autoFocus) {
    focusNode.requestFocus();
  }
}