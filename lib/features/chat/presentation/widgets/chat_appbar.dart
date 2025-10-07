import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tellioo/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:tellioo/features/chat/presentation/bloc/chat_event.dart';
import 'package:tellioo/features/chat/presentation/bloc/chat_state.dart';
import 'package:tellioo/core/theme/app_colors.dart';
import 'package:tellioo/core/theme/app_text_styles.dart';
import 'package:tellioo/core/widgets/center_toast.dart';

/// Custom AppBar for the ChatScreen. Changes depending on view state (main vs history),
/// and supports refreshing the conversation or deleting it from history.
class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isHistoryView; // Whether the user is currently in history view
  final VoidCallback onBackPressed; // Callback when the back button is pressed

  const ChatAppBar({
    Key? key,
    required this.isHistoryView,
    required this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white, 
      elevation: 0,
      iconTheme: const IconThemeData(
        color: Colors.black, 
      ),

      /// Display context-aware title
      title: Text(
        isHistoryView ? "Context" : "...",
        style: AppTextStyles.appBarTitleText.copyWith(
            color: AppColors.primaryBlack, 
            fontSize: 16
        ),
      ),


      /// - History View → back arrow
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black, 
        ),
        onPressed: onBackPressed,
      ),

      /// Action buttons:
      ///  allow "refresh" to reset the chat session
      actions: [
        IconButton(
          icon: const Icon(
            Icons.refresh,
            color: Colors.black,
          ),
          tooltip: "Refresh Chat",
          onPressed: () async {
            final chatBloc = context.read<ChatBloc>();
            final chatState = chatBloc.state;

            final isStreaming = chatState.maybeWhen(
              loading: (messages, currentConversation) => currentConversation.isNotEmpty,
              success: (_, currentConversation, isStreaming) => isStreaming,
              orElse: () => false,
            );

            if (isStreaming) return;

            final hasConversation = chatState.maybeWhen(
              loading: (_, currentConversation) => currentConversation.isNotEmpty,
              success: (_, currentConversation, __) => currentConversation.isNotEmpty,
              failure: (_, __, currentConversation) => currentConversation.isNotEmpty,
              orElse: () => false,
            );

            if (hasConversation) {
              final overlayEntry = OverlayEntry(
                builder: (context) => const CenterToast(
                  message: "Chat has been refreshed",
                ),
              );

              Overlay.of(context).insert(overlayEntry);

              Future.delayed(const Duration(seconds: 2), () {
                overlayEntry.remove();
              });
            }

            chatBloc.add(const ChatEvent.resetConversation(keepSession: true));
          },
        ),
      ],
    );
  }

  /// Required override to set AppBar height
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
