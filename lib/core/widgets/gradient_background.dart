// gradientBackground.dart

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// A widget that wraps a child with a customizable linear gradient background.
/// If no gradient is provided, it attempts to use the current theme’s gradient,
/// falling back to a default white-to-blue gradient if none is available.
class GradientBackground extends StatelessWidget {
  final Widget child;                // The content to display over the background
  final LinearGradient? gradient;    // Optional custom gradient override

  const GradientBackground({Key? key, required this.child, this.gradient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Try to get the gradient from the theme's AppGradientTheme extension.
    // Use the passed-in gradient if provided, otherwise fallback to default.
    final gradientTheme = Theme.of(context).extension<AppGradientTheme>();
    final gradient = this.gradient ?? gradientTheme?.defaultGradient ??
        const LinearGradient(
          colors: [AppColors.primaryWhite, AppColors.backgroundLightBlue,], // Fallback gradient
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );

    // Apply the resolved gradient as the background decoration
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
      ),
      child: child, // Display the child widget on top
    );
  }
}

/// A custom ThemeExtension to define a default gradient that can be themed
/// and applied consistently across the app.
class AppGradientTheme extends ThemeExtension<AppGradientTheme> {
  final LinearGradient defaultGradient;

  AppGradientTheme({required this.defaultGradient});

  /// Creates a new copy of this theme with optional overrides
  @override
  AppGradientTheme copyWith({LinearGradient? defaultGradient}) {
    return AppGradientTheme(
      defaultGradient: defaultGradient ?? this.defaultGradient,
    );
  }

  /// Interpolates between two AppGradientTheme instances (used during theme transitions)
  @override
  AppGradientTheme lerp(ThemeExtension<AppGradientTheme>? other, double t) {
    if (other is! AppGradientTheme) {
      return this;
    }
    return AppGradientTheme(
      defaultGradient: LinearGradient.lerp(defaultGradient, other.defaultGradient, t)!,
    );
  }
}
