import 'package:flutter/material.dart';

/// A custom toast widget that appears in the center of the screen
/// and fades out automatically after a short duration.
/// Typically used to display short messages like "Copied to clipboard".
class CenterToast extends StatefulWidget {
  final String message; // Message to be shown in the toast

  const CenterToast({Key? key, required this.message}) : super(key: key);

  @override
  _CenterToastState createState() => _CenterToastState();
}

class _CenterToastState extends State<CenterToast>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller for the fade effect
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    // Fade animation using a curved easing function
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    // Start the fade-in animation
    _animationController.forward();

    // After 2 seconds, start fade-out and remove the widget from overlay
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        _animationController.reverse().then((_) => Navigator.of(context).pop());
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose(); // Dispose controller to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Positioned(
      // Center the toast vertically
      top: MediaQuery.of(context).size.height / 2 - 30,
      left: 40,
      right: 40,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Material(
          color: Colors.transparent, // Ensure background doesn't overlay
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: isDarkMode
                  ? Colors.grey.withOpacity(0.85)
                  : Colors.black.withOpacity(0.85),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.copy_rounded, color: Colors.white, size: 18),
                const SizedBox(width: 10),
                Text(
                  widget.message,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}