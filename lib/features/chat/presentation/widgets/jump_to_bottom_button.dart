import 'package:flutter/material.dart';

/// A floating button that appears when the user scrolls up
/// and can be tapped to jump to the bottom of a scroll view.
class JumpToBottomButton extends StatelessWidget {
  /// Callback to trigger when the button is tapped.
  final VoidCallback? onTap;

  const JumpToBottomButton({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        // Trigger the passed callback when tapped, or do nothing if null
        onTap: onTap ?? () {},

        child: Container(
          // Padding for tap area around the icon
          padding: const EdgeInsets.all(8),

          // Style the container to be a floating circular button
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.7), // Semi-transparent background
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3), // Subtle drop shadow
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),

          // Icon indicating scroll-down action
          child: const Icon(
            Icons.arrow_downward_rounded,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }
}