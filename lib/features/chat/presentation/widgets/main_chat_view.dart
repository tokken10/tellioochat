import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tellioo/core/widgets/gradient_background.dart';
import 'package:tellioo/features/chat/domain/entities/chat_message.dart';
import 'package:tellioo/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:tellioo/features/chat/presentation/bloc/chat_state.dart';
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
                child: BlocBuilder<ChatBloc, ChatState>(
                  builder: (context, state) {
                    final List<ChatMessage> conversation = state.maybeWhen(
                      loading: (_, currentConversation) => currentConversation,
                      success: (_, currentConversation, __) => currentConversation,
                      failure: (_, __, currentConversation) => currentConversation,
                      orElse: () => const <ChatMessage>[],
                    );

                    final bool isStreaming = state.maybeWhen(
                      loading: (_, __) => true,
                      success: (_, __, isStreaming) => isStreaming,
                      orElse: () => false,
                    );

                    return ValueListenableBuilder<TextEditingValue>(
                      valueListenable: textController,
                      builder: (context, value, _) {
                        final bool userIsTyping = value.text.trim().isNotEmpty;

                        return SingleChildScrollView(
                          controller: scrollController,
                          padding: const EdgeInsets.only(bottom: 125, top: 5),
                          child: conversation.isEmpty
                              ? ChatEmptyState(
                                  userIsTyping: userIsTyping,
                                  textController: textController,
                                )
                              : ChatMessageContent(
                                  conversation: conversation,
                                  isTyping: isStreaming,
                                  isGenerating: isStreaming,
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
            ],
          ),
        ),
      ),
    );
  }
}
