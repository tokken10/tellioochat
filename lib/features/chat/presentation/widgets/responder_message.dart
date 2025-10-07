import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter/material.dart';
import 'package:tellioo/core/theme/app_colors.dart';
import 'package:tellioo/core/theme/app_text_styles.dart';
import 'package:tellioo/core/widgets/center_toast.dart';
import 'package:tellioo/features/chat/domain/entities/chat_message.dart';

/// A widget to display the AI's response message bubble,
/// along with action buttons like Reply, Copy, and Context.
class ResponderMessage extends StatelessWidget {
  final ChatMessage message;
  final bool isTyping;                           // Whether the AI is still typing
  final bool isGeneratingResponse;               // Whether a response is being generated
  final bool isLastResponderMessage;             // Marks if this is the final message in the list
  final bool addSpacing;                         // Adds spacing after the bubble if needed
  final TextEditingController? textController;   // Controller to access the user's input
  final FocusNode? focusNode;                    // Focus node to control input field focus
  final VoidCallback onContextTap;               // Callback to open the history/context view

  const ResponderMessage({
    Key? key,
    required this.message,
    this.isTyping = false,
    this.isGeneratingResponse = false,
    this.isLastResponderMessage = false,
    this.addSpacing = false,
    this.textController,
    this.focusNode,
    required this.onContextTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 6.0, right: 6.0, bottom: 8, top: 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // AI message bubble
                Container(
                  decoration: BoxDecoration(
                    color: isDarkMode
                        ? AppColors.responderMessageColorDark
                        : AppColors.responderMessageColorLight,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.all(25),
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: _buildResponderContent(context),
                ),

                // Action buttons (Reply, Copy, Context)
                if (!isTyping && !isGeneratingResponse && message.content.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                    child: Row(
                      children: [
                        // Reply button focuses input field
                        _ActionButton(
                          icon: Icons.reply_rounded,
                          label: 'Reply',
                          onTap: () {
                            if (focusNode != null) {
                              focusNode!.requestFocus();
                              Scrollable.ensureVisible(
                                context,
                                alignment: 1.0,
                                duration: const Duration(milliseconds: 300),
                              );
                            }
                          },
                        ),

                        const SizedBox(width: 16),

                        // Copy button stores response in clipboard
                        _ActionButton(
                          icon: Icons.copy_rounded,
                          label: 'Copy',
                          onTap: () {
                            Clipboard.setData(ClipboardData(text: message.content));

                            OverlayEntry overlayEntry = OverlayEntry(
                              builder: (context) => CenterToast(message: "Copied to clipboard"),
                            );

                            Overlay.of(context).insert(overlayEntry);

                            Future.delayed(const Duration(seconds: 2), () {
                              overlayEntry.remove();
                            });
                          },
                        ),

                        const SizedBox(width: 16),

                        // Context button triggers navigation to history view
                        _ActionButton(
                          icon: Icons.history_rounded,
                          label: 'Context',
                          onTap: onContextTap,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),

        // Optional spacing below the message
        if (addSpacing) const SizedBox(height: 15),
      ],
    );
  }

  /// Builds either a loading indicator or formatted markdown content
  Widget _buildResponderContent(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkMode ? Colors.white : Colors.black;

    // Show loader when generating
    if (isGeneratingResponse) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(textColor),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            "Generating response...",
            style: AppTextStyles.respondersMsgText.copyWith(color: textColor),
          ),
        ],
      );
    } else {
      // Show formatted response using Markdown
      return MarkdownBody(
        data: message.content,
        styleSheet: MarkdownStyleSheet(
          p: AppTextStyles.respondersMsgText.copyWith(color: textColor),
        ),
      );
    }
  }
}

/// Reusable internal widget for action buttons below the response
class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final color = isDarkMode ? Colors.white.withOpacity(0.7) : Colors.black.withOpacity(0.6);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 16, color: color),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  fontSize: 13,
                  color: color,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
