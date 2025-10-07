import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tellioo/core/theme/app_colors.dart';
import 'package:tellioo/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:tellioo/features/chat/presentation/bloc/chat_event.dart';

/// This widget displays the empty chat state UI,
/// including a motivational message, a random hint, and quick prompt chips.
class ChatEmptyState extends StatelessWidget {
  final bool userIsTyping; // Whether the user is actively typing
  final TextEditingController textController; // Controller for the input field

  const ChatEmptyState({
    Key? key,
    required this.userIsTyping,
    required this.textController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // A pool of helpful and fun prompt ideas for users
    final hints = [
      "Did you know you can ask to summarize any text?",
      "Brainstorm ideas on any topic.",
      "Ask to explain code or plan your next trip!",
      "Ask for advice on anything!",
      "Ask for a recipe or a workout plan!",
      "Ask for a list of things to do in a city!",
      "Write an app review"
    ];

    // Select a random hint to display
    final randomHint = hints[Random().nextInt(hints.length)];

    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Explore Anything!",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Show only if the user isn't typing
            if (!userIsTyping) ...[
              Text(
                randomHint,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),

              // Display action chips for quick prompt suggestions
              Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.center,
                children: [
                  _buildQuickPrompt(context, "Tell me a joke"),
                  _buildQuickPrompt(context, "Explain AI in simple terms"),
                  _buildQuickPrompt(context, "Design a fitness plan"),
                  _buildQuickPrompt(context, "Plan a trip to Tokyo"),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  /// Builds a tappable ActionChip for each prompt
  Widget _buildQuickPrompt(BuildContext context, String prompt) {
    return ActionChip(
      backgroundColor: AppColors.listWhite,
      label: Text(prompt),
      onPressed: () {
        final chatBloc = context.read<ChatBloc>();

          chatBloc.add(ChatEvent.executePrompt(prompt));

      },
    );
  }
}
