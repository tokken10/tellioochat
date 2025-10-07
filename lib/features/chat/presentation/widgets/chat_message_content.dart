import 'package:flutter/material.dart';

import 'package:tellioo/features/chat/domain/entities/chat_message.dart';
import 'package:tellioo/features/chat/presentation/widgets/responder_message.dart';
import 'package:tellioo/features/chat/presentation/widgets/user_message_bubble.dart';
import 'swipable_chat.dart';

/// This widget displays the most recent user message and its corresponding AI response.
/// It is designed to be used within the main chat view to show the latest message exchange.
class ChatMessageContent extends StatelessWidget {
  final List<ChatMessage> conversation;
  final bool isTyping;                        // Whether the AI is currently typing
  final bool isGenerating;                    // Whether the AI is generating a new response
  final TextEditingController textController; // Controller for the user's input text
  final FocusNode focusNode;                  // Focus node for managing keyboard focus
  final GlobalKey swipeKey;                   // Reference to SwipeableChatState to trigger history view

  const ChatMessageContent({
    Key? key,
    required this.conversation,
    required this.isTyping,
    required this.isGenerating,
    required this.textController,
    required this.focusNode,
    required this.swipeKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChatMessage? userMessage;
    ChatMessage? responseMessage;

    // Traverse messages from the end to find the last user message
    // and its corresponding response (if present)
    for (int i = conversation.length - 1; i >= 0; i--) {
      if (conversation[i].isUserMessage) {
        userMessage = conversation[i];
        if (i + 1 < conversation.length && !conversation[i + 1].isUserMessage) {
          responseMessage = conversation[i + 1];
        }
        break;
      }
    }

    final bool responseHasContent =
        responseMessage?.content.trim().isNotEmpty ?? false;
    final bool showGeneratingIndicator = isGenerating && !responseHasContent;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Display the last user message
        if (userMessage != null) UserMessageBubble(message: userMessage),

        if (userMessage != null) const SizedBox(height: 16),

        // Display the matching response message if available
        if (responseMessage != null)
          ResponderMessage(
            message: responseMessage,
            isTyping: isTyping,
            isGeneratingResponse: showGeneratingIndicator,
            isLastResponderMessage: true,
            addSpacing: false,
            textController: textController,
            focusNode: focusNode,
            onContextTap: () {
              // Tapping on context icon animates to history view
              final swipeableChatState = swipeKey.currentState as SwipeableChatState?;
              swipeableChatState?.animateToHistory();
            },
          )

        // Otherwise, show a generating placeholder
        else if (showGeneratingIndicator)
          ResponderMessage(
            message: const ChatMessage(content: '', isUserMessage: false),
            isTyping: false,
            isGeneratingResponse: true,
            isLastResponderMessage: true,
            addSpacing: false,
            onContextTap: () {
              final swipeableChatState = swipeKey.currentState as SwipeableChatState?;
              swipeableChatState?.animateToHistory();
            },
          ),
      ],
    );
  }
}
