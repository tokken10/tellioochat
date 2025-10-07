import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:tellioo/core/theme/app_colors.dart';
import 'package:tellioo/core/theme/app_text_styles.dart';
import 'package:tellioo/core/widgets/center_toast.dart';
import 'package:tellioo/features/chat/domain/entities/chat_message.dart';

/// A collapsible AI message widget used in the chat history view.
/// Expands on tap to reveal full Markdown-formatted content.
class CollapsingResponderMessage extends StatefulWidget {
  final ChatMessage message;
  final bool isTyping;
  final bool isGeneratingResponse;
  final bool isLastCollapsingResponderMessage;
  final bool addSpacing;

  const CollapsingResponderMessage({
    Key? key,
    required this.message,
    this.isTyping = false,
    this.isGeneratingResponse = false,
    this.isLastCollapsingResponderMessage = false,
    this.addSpacing = false,
  }) : super(key: key);

  @override
  _CollapsingResponderMessageState createState() => _CollapsingResponderMessageState();
}

class _CollapsingResponderMessageState extends State<CollapsingResponderMessage> {
  bool _isExpanded = false; // Tracks whether the message is expanded or collapsed
  static const int _maxLinesCollapsed = 3; // Number of lines to show when collapsed

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkMode ? Colors.white : Colors.black;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Gesture to toggle expansion on tap
        GestureDetector(
          onTap: () => setState(() => _isExpanded = !_isExpanded),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 6.0, right: 6.0, bottom: 4, top: 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Bubble container with responder content
                  Container(
                    decoration: BoxDecoration(
                      color: isDarkMode
                          ? AppColors.responderMessageColorDark
                          : AppColors.responderMessageColorLight,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.all(25),
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // If AI is generating, show spinner
                        if (widget.isGeneratingResponse)
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    isDarkMode
                                        ? AppColors.primaryWhite
                                        : AppColors.primaryBlack,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "Generating response...",
                                style: AppTextStyles.respondersMsgText.copyWith(color: textColor),
                              ),
                            ],
                          )
                        else
                        // Collapsed or expanded message content
                          LayoutBuilder(
                            builder: (context, constraints) {
                              final style = AppTextStyles.respondersMsgText.copyWith(color: textColor);
                              final truncatedText = _getFirstThreeLines(
                                widget.message.content,
                                style,
                                constraints.maxWidth,
                              );

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _isExpanded
                                      ? MarkdownBody(
                                    data: widget.message.content,
                                    styleSheet: MarkdownStyleSheet(p: style),
                                  )
                                      : Text(
                                    truncatedText,
                                    style: style,
                                    maxLines: _maxLinesCollapsed,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  _buildToggleButton(textColor),
                                ],
                              );
                            },
                          ),
                      ],
                    ),
                  ),

                  // Copy button appears when expanded
                  if (_isExpanded && !widget.isGeneratingResponse)
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                      child: _ActionButton(
                        icon: Icons.copy_rounded,
                        label: 'Copy',
                        onTap: () {
                          Clipboard.setData(ClipboardData(text: widget.message.content));

                          final overlayEntry = OverlayEntry(
                            builder: (context) => CenterToast(message: "Copied to clipboard"),
                          );

                          Overlay.of(context).insert(overlayEntry);

                          Future.delayed(const Duration(seconds: 2), () {
                            overlayEntry.remove();
                          });
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
        if (widget.addSpacing) const SizedBox(height: 15),
      ],
    );
  }

  /// Extracts only the first few lines of a text to fit within collapsed view.
  String _getFirstThreeLines(String text, TextStyle style, double maxWidth) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: _maxLinesCollapsed,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: maxWidth);

    if (!textPainter.didExceedMaxLines) return text;

    final words = text.split(' ');
    String result = "";
    for (var word in words) {
      final newResult = result.isEmpty ? word : "$result $word";
      final newTextPainter = TextPainter(
        text: TextSpan(text: newResult, style: style),
        maxLines: _maxLinesCollapsed,
        textDirection: TextDirection.ltr,
      )..layout(maxWidth: maxWidth);

      if (newTextPainter.didExceedMaxLines) break;
      result = newResult;
    }

    return "$result...";
  }

  /// Builds the "Show more / Show less" toggle below the message.
  Widget _buildToggleButton(Color textColor) {
    return GestureDetector(
      onTap: () => setState(() => _isExpanded = !_isExpanded),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            size: 16,
            color: textColor.withOpacity(0.6),
          ),
          const SizedBox(width: 4),
          Text(
            _isExpanded ? "Show Less" : "Show More",
            style: TextStyle(
              color: textColor.withOpacity(0.6),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

/// A reusable small button widget with icon and label.
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
