import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/chat/chat_bloc.dart';
import '../../../bloc/chat/chat_state.dart';
import 'collapsing_responder.dart';
import '../../app/widgets/gradientBackground.dart';
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
                    // Only show content when chat is loaded
                    if (state is ChatLoaded) {
                      final historyMessages = state.messages;

                      // Show placeholder if history is empty
                      if (historyMessages.isEmpty) {
                        return const Center(
                          child: Text("No chat history available."),
                        );
                      }

                      // Display list of messages in order
                      return ListView.builder(
                        padding: const EdgeInsets.only(bottom: 125, top: 5),
                        itemCount: historyMessages.length,
                        itemBuilder: (context, index) {
                          final message = historyMessages[index];

                          // Render user or AI message accordingly
                          return message.isSentByUser
                              ? UserMessageBubble(message: message)
                              : CollapsingResponderMessage(
                            message: message,
                            isTyping: false,
                            isGeneratingResponse: false,
                            addSpacing: true,
                          );
                        },
                      );
                    }

                    // Return nothing if chat is not loaded
                    return const SizedBox.shrink();
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