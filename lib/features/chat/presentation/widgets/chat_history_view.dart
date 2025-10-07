import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tellioo/features/chat/domain/entities/chat_message.dart';
import 'package:tellioo/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:tellioo/features/chat/presentation/bloc/chat_state.dart';
import 'package:tellioo/core/widgets/gradient_background.dart';

import 'collapsing_responder.dart';
import 'user_message_bubble.dart';

/// A widget that displays the full history of the chat conversation,
/// showing both user and AI messages in a scrollable list.
class ChatHistoryView extends StatelessWidget {
  const ChatHistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Dismisses the keyboard when tapping anywhere outside input
      onTap: () => FocusScope.of(context).unfocus(),

      // Background wrapper with gradient and safe area
      child: GradientBackground(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                // Listens to chat state changes
                child: BlocBuilder<ChatBloc, ChatState>(
                  builder: (context, state) {
                    final List<ChatMessage> historyMessages = state.maybeWhen(
                      loading: (messages, _) => messages,
                      success: (messages, __, ___) => messages,
                      failure: (_, messages, __) => messages,
                      orElse: () => const <ChatMessage>[],
                    );

                    if (historyMessages.isEmpty) {
                      return const Center(
                        child: Text('No chat history available.'),
                      );
                    }

                    return ListView.builder(
                      padding: const EdgeInsets.only(bottom: 125, top: 5),
                      itemCount: historyMessages.length,
                      itemBuilder: (context, index) {
                        final message = historyMessages[index];
                        return message.isUserMessage
                            ? UserMessageBubble(message: message)
                            : CollapsingResponderMessage(
                                message: message,
                                isTyping: false,
                                isGeneratingResponse: false,
                                addSpacing: true,
                              );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
