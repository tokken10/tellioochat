import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tellioo/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:tellioo/features/chat/presentation/bloc/chat_event.dart';
import 'package:tellioo/features/chat/presentation/bloc/chat_state.dart';
import 'package:tellioo/features/chat/presentation/widgets/chat_history_view.dart';
import 'package:tellioo/features/chat/presentation/widgets/chat_input_field.dart';
import 'package:tellioo/features/chat/presentation/widgets/jump_to_bottom_button.dart';
import 'package:tellioo/features/chat/presentation/widgets/main_chat_view.dart';
import 'package:tellioo/features/chat/presentation/widgets/swipable_chat.dart';

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
              hasHistory: state.maybeWhen(
                loading: (messages, _) => messages.isNotEmpty,
                success: (messages, __, ___) => messages.isNotEmpty,
                failure: (_, messages, __) => messages.isNotEmpty,
                orElse: () => false,
              ),
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
                  context.read<ChatBloc>().add(ChatEvent.sendMessage(text));
                    controller.clear(); // Clear text field
                    swipeKey.currentState?.animateToMain(); // Ensure in main view
                  }
                },

                // Handle "Stop Generating" action
                onStopGenerating: () {
                  context.read<ChatBloc>().add(const ChatEvent.stopGeneration());
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
