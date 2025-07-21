import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tellioo/bloc/chat/chat_bloc.dart';
import 'package:tellioo/bloc/chat/chat_state.dart';
import 'package:tellioo/screens/chat/widgets/chat_history_view.dart';
import 'package:tellioo/screens/chat/widgets/chat_input_field.dart';
import 'package:tellioo/screens/chat/widgets/jump_to_bottom_button.dart';
import 'package:tellioo/screens/chat/widgets/main_chat_view.dart';
import 'package:tellioo/screens/chat/widgets/swipable_chat.dart';

import '../../../bloc/chat/chat_event.dart';

/// Displays the full chat content: swipeable views, input field, and floating button
class ChatContent extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final ScrollController scrollController;
  final GlobalKey<SwipeableChatState> swipeKey;
  final bool showJumpToBottom;
  final bool isHistoryView;
  final ValueChanged<bool> onToggleView;

  const ChatContent({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.scrollController,
    required this.swipeKey,
    required this.showJumpToBottom,
    required this.isHistoryView,
    required this.onToggleView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        return Stack(
          children: [
            /// The main content view that supports horizontal swiping between
            /// the current conversation and the chat history view
            SwipeableChat(
              key: swipeKey,
              currentChatView: MainChatView(
                scrollController: scrollController,
                textController: controller,
                focusNode: focusNode,
                swipeKey: swipeKey,
              ),
              historyView: const ChatHistoryView(),
              hasHistory: state is ChatLoaded && state.messages.isNotEmpty,
              onViewChanged: onToggleView,
            ),

            /// A floating "Jump to Bottom" button that appears when the user scrolls up
            if (showJumpToBottom && !isHistoryView && !focusNode.hasFocus)
              Positioned(
                left: 0,
                right: 0,
                bottom: 135,
                child: JumpToBottomButton(
                  onTap: (){
                    scrollController.animateTo(
                      scrollController.position.maxScrollExtent,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  },
                ),
              ),

            /// The text input field for sending messages, pinned to the bottom
            Positioned(
              left: 0,
              right: 0,
              bottom: 25,
              child: ChatInputField(
                controller: controller,
                focusNode: focusNode,
                isHistoryView: isHistoryView,
                showJumpToBottomButton: showJumpToBottom,

                // Handle the "Send" action
                onSend: () {
                  final text = controller.text.trim();
                  if (text.isNotEmpty) {
                    FocusScope.of(context).unfocus(); // Close keyboard
                    context.read<ChatBloc>().add(SendMessage(text)); // Dispatch event
                    controller.clear(); // Clear text field
                    swipeKey.currentState?.animateToMain(); // Ensure in main view
                  }
                },

                // Handle "Stop Generating" action
                onStopGenerating: () {
                  context.read<ChatBloc>().add(const StopGenerating());
                },

                // Refocus the input field on tap
                onTap: () {
                  Future.delayed(const Duration(milliseconds: 100), () {
                    focusNode.requestFocus();
                  });
                },
              ),
            ),
          ],
        );
      },
    );
  }
}