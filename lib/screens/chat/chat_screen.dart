import 'package:flutter/material.dart';
import 'package:tellioo/screens/chat/widgets/chat_appbar.dart';
import 'package:tellioo/screens/chat/widgets/chat_initializer.dart';
import 'widgets/swipable_chat.dart';
import 'widgets/chat_content.dart';

/// ChatScreen is the main UI for interacting with the chat.
/// It supports prompts, FAQs, and user-initiated messages.
class ChatScreen extends StatefulWidget {
  final int? sessionKey;
  final bool autoFocus;

  const ChatScreen({
    Key? key,
    this.sessionKey,
    this.autoFocus = false,
  }) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final controller = TextEditingController();
  final focusNode = FocusNode();
  final scrollController = ScrollController();
  final swipeKey = GlobalKey<SwipeableChatState>();

  bool isHistoryView = false;
  bool showJumpToBottom = false;

  @override
  void initState() {
    super.initState();

    // Listen to scroll to toggle the visibility of the jump-to-bottom button
    scrollController.addListener(_handleScroll);

    // Kick off initial setup after first frame is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initializeChat(context, widget, focusNode);
    });
  }

  /// Handles scroll logic to determine when to show jump-to-bottom FAB
  void _handleScroll() {
    if (scrollController.hasClients && !isHistoryView) {
      final max = scrollController.position.maxScrollExtent;
      setState(() => showJumpToBottom = max > 0 && scrollController.offset < max - 200);
    }
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Custom Chat AppBar that handles back logic
      appBar: ChatAppBar(
        isHistoryView: isHistoryView,
        onBackPressed: () {
          swipeKey.currentState?.animateToMain();
        },
      ),

      // Chat UI layout with messages, input, and optional jump button
      body: ChatContent(
        controller: controller,
        focusNode: focusNode,
        scrollController: scrollController,
        swipeKey: swipeKey,
        showJumpToBottom: showJumpToBottom,
        isHistoryView: isHistoryView,
        onToggleView: (v) => setState(() => isHistoryView = v),
      ),
    );
  }
}