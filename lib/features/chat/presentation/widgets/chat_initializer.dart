import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tellioo/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:tellioo/features/chat/presentation/bloc/chat_event.dart';

/// Initializes the chat experience
void initializeChat(
    BuildContext context,
    bool autoFocus,
    FocusNode focusNode,
    ) {
  final chatBloc = context.read<ChatBloc>();

  chatBloc.add(const ChatEvent.resetConversation(keepSession: true));

  // Focus the input field
  if (autoFocus) {
    focusNode.requestFocus();
  }
}
