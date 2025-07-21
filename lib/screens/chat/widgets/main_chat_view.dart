import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/chat/chat_bloc.dart';
import '../../../bloc/chat/chat_state.dart';
import '../../app/widgets/gradientBackground.dart';
import 'chat_empty_state.dart';
import 'chat_message_content.dart';

class MainChatView extends StatelessWidget {
  final ScrollController scrollController;
  final TextEditingController textController;
  final FocusNode focusNode;
  final GlobalKey swipeKey;

  const MainChatView({
    Key? key,
    required this.scrollController,
    required this.textController,
    required this.focusNode,
    required this.swipeKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Unfocus the keyboard when tapping outside input
      onTap: () => FocusScope.of(context).unfocus(),
      child: GradientBackground(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: BlocListener<ChatBloc, ChatState>(
                  // Only listen when typing finishes and generation stops
                  listenWhen: (prev, curr) =>
                  prev is ChatLoaded &&
                      curr is ChatLoaded &&
                      prev.isTyping &&
                      !curr.isTyping &&
                      !curr.isGeneratingResponse,
                  listener: (context, state) async {},

                  // Build the main view based on chat state
                  child: BlocBuilder<ChatBloc, ChatState>(
                    builder: (context, state) {
                      return ValueListenableBuilder<TextEditingValue>(
                        valueListenable: textController,
                        builder: (context, value, _) {
                          final bool userIsTyping = value.text.trim().isNotEmpty;

                          return SingleChildScrollView(
                            controller: scrollController,
                            padding: const EdgeInsets.only(bottom: 125, top: 5),

                            // Show empty state if chat is empty or just started
                            child: state is ChatInitial ||
                                (state is ChatLoaded && state.currentConversation.isEmpty)
                                ? ChatEmptyState(
                              userIsTyping: userIsTyping,
                              textController: textController,
                            )

                            // Otherwise show chat content
                                : ChatMessageContent(
                              conversation: (state as ChatLoaded).currentConversation,
                              isTyping: state.isTyping,
                              isGenerating: state.isGeneratingResponse,
                              textController: textController,
                              focusNode: focusNode,
                              swipeKey: swipeKey,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}