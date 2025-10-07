import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tellioo/core/theme/app_colors.dart';
import 'package:tellioo/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:tellioo/features/chat/presentation/bloc/chat_state.dart';

/// The text input field used at the bottom of the Chat UI.
/// Supports streaming state, dynamic height, and dark/light mode theming.
class ChatInputField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool isHistoryView;
  final bool showJumpToBottomButton;
  final VoidCallback onSend;
  final VoidCallback onStopGenerating;
  final VoidCallback onTap;

  const ChatInputField({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.isHistoryView,
    required this.showJumpToBottomButton,
    required this.onSend,
    required this.onStopGenerating,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        // Determines if AI is currently generating a response
        final bool isResponseStreaming = state.maybeWhen(
          loading: (_, __) => true,
          success: (_, __, isStreaming) => isStreaming,
          orElse: () => false,
        );

        // Checks if a conversation exists
        final bool hasConversation = state.maybeWhen(
          loading: (_, currentConversation) => currentConversation.isNotEmpty,
          success: (_, currentConversation, __) => currentConversation.isNotEmpty,
          failure: (_, __, currentConversation) => currentConversation.isNotEmpty,
          orElse: () => false,
        );

        // Set placeholder text based on view state
        final String hintText = isHistoryView ? "Message..." : (hasConversation ? "Reply..." : "Message...");

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: double.infinity,
            constraints: const BoxConstraints(maxWidth: 584),
            child: Focus(
              onFocusChange: (hasFocus) {
                // Automatically unfocus when losing focus
                if (!hasFocus) {
                  FocusScope.of(context).unfocus();
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: AppColors.backgroundLightBlue,
                  borderRadius: BorderRadius.circular(17),
                  boxShadow: [
                    // Bottom-right shadow
                    BoxShadow(
                      color:  Colors.blueGrey.withOpacity(0.3),
                      offset: const Offset(6, 6),
                      blurRadius: 10,
                    ),
                    // Top-left highlight
                    BoxShadow(
                      color: Colors.white.withOpacity(0.6),
                      offset: const Offset(-4, -4),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Leading icon (edit pencil)
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0, right: 8.0),
                        child: Icon(
                          Icons.edit_note_rounded,
                          color: Colors.grey.shade600,
                          size: 24,
                        ),
                      ),

                      // Text input area
                      Expanded(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(
                            minHeight: 40,
                            maxHeight: 150,
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            reverse: true,
                            child: TextFormField(
                              controller: controller,
                              focusNode: focusNode,
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              textInputAction: TextInputAction.newline,
                              decoration: InputDecoration(
                                hintText: hintText,
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 16,
                                ),
                                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                                isDense: true,
                              ),
                              style: const TextStyle(fontSize: 16),
                              onTap: onTap, // Callback when user taps into field
                            ),
                          ),
                        ),
                      ),

                      // Send or Stop button
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 4.0),
                        child: IconButton(
                          icon: Icon(
                            isResponseStreaming ? Icons.stop_rounded : Icons.send,
                            color: Colors.black,
                            size: 24,
                          ),
                          onPressed: isResponseStreaming ? onStopGenerating : onSend,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
