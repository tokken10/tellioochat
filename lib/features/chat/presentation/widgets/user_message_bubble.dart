import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tellioo/core/theme/app_colors.dart';
import 'package:tellioo/core/theme/app_text_styles.dart';
import 'package:tellioo/core/widgets/center_toast.dart';
import 'package:tellioo/features/chat/domain/entities/chat_message.dart';

/// A bubble widget that displays a message sent by the user.
class UserMessageBubble extends StatelessWidget {
  final ChatMessage message;

  const UserMessageBubble({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Align(
      alignment: Alignment.centerRight, // Aligns user message to the right
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.9, // Prevents bubble from exceeding screen width
        ),
        child: GestureDetector(
          // Copies message to clipboard on long press
          onLongPress: () {
            Clipboard.setData(ClipboardData(text: message.content));

            final overlayEntry = OverlayEntry(
              builder: (context) => const CenterToast(
                message: "Message copied to clipboard",
              ),
            );

            Overlay.of(context).insert(overlayEntry);

            // Remove the toast after 2 seconds
            Future.delayed(const Duration(seconds: 2), () {
              overlayEntry.remove();
            });
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 4.0), // Spacing between bubbles
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0), // Bubble padding
            decoration: BoxDecoration(
              color: isDarkMode
                  ? AppColors.offBlackBox
                  : AppColors.userMessageColorLight.withOpacity(.1), // Background based on theme
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
                bottomLeft: Radius.circular(12.0), // Rounded bubble corners
              ),
            ),
            child: Text(
              message.content,
              style: AppTextStyles.userMsgText.copyWith(
                color: isDarkMode ? AppColors.primaryWhite : AppColors.primaryBlack,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
