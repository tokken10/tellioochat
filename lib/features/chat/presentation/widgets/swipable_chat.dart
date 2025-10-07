import 'package:flutter/material.dart';

/// A swipeable widget that allows transitioning between the current chat view
/// and the history view with smooth animations.
class SwipeableChat extends StatefulWidget {
  final Widget currentChatView;       // Main chat content
  final Widget historyView;           // History view to show past messages
  final Function(bool) onViewChanged; // Callback to notify parent when view changes
  final bool hasHistory;              // Determines if history is available to swipe into

  const SwipeableChat({
    Key? key,
    required this.currentChatView,
    required this.historyView,
    required this.onViewChanged,
    required this.hasHistory,
  }) : super(key: key);

  @override
  SwipeableChatState createState() => SwipeableChatState();
}

class SwipeableChatState extends State<SwipeableChat>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  bool _isHistoryViewVisible = false; // Tracks if history view is shown

  @override
  void initState() {
    super.initState();

    // Setup animation controller for slide transition
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    // Define slide animation: moves current view left when going to history
    _animation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(-1, 0),
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Public method to programmatically return to the main chat view
  void animateToMain() {
    if (_isHistoryViewVisible) {
      _controller.reverse();
      setState(() {
        _isHistoryViewVisible = false;
        widget.onViewChanged(false);
      });
    }
  }

  /// Public method to programmatically open the history view,
  /// only if messages exist
  void animateToHistory() {
    if (!_isHistoryViewVisible && widget.hasHistory) {
      _controller.forward();
      setState(() {
        _isHistoryViewVisible = true;
        widget.onViewChanged(true);
      });
    }
  }

  /// Handles horizontal swipe gestures to update the animation in real-time
  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    final width = context.size?.width ?? 1;
    final delta = details.primaryDelta! / width;

    if (!_isHistoryViewVisible && delta < 0 && widget.hasHistory) {
      // Swiping left to reveal history
      _controller.value -= delta;
    } else if (_isHistoryViewVisible && delta > 0) {
      // Swiping right to return to main view
      _controller.value += delta;
    }
  }

  /// Finalizes the view transition based on swipe velocity and animation progress
  void _onHorizontalDragEnd(DragEndDetails details) {
    final velocity = details.primaryVelocity ?? 0;

    if (_isHistoryViewVisible) {
      // Decide whether to return to main or remain on history
      if (velocity > 0 || _controller.value < 0.5) {
        animateToMain();
      } else {
        _controller.forward(); // Stay on history
      }
    } else {
      // Swiping left – go to history if allowed
      if (widget.hasHistory && (velocity < 0 || _controller.value > 0.5)) {
        animateToHistory();
      } else {
        _controller.reverse(); // Stay on main
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onHorizontalDragUpdate: (details) {
            // Prevent gesture conflict with PageView edges
            final isNearEdge = details.globalPosition.dx < 20 ||
                details.globalPosition.dx > constraints.maxWidth - 20;
            if (isNearEdge) return;

            _onHorizontalDragUpdate(details);
          },
          onHorizontalDragEnd: _onHorizontalDragEnd,
          child: Stack(
            children: [
              Positioned.fill(child: widget.historyView),      // Static background
              SlideTransition(
                position: _animation,
                child: widget.currentChatView,                // Animated sliding foreground
              ),
            ],
          ),
        );
      },
    );
  }
}
