import 'package:flutter/material.dart';

import 'app_colors.dart';

class DarkColors extends AppColors {
  // Primary
  @override
  Color get primary => const Color(0xFF64B5F6);

  @override
  Color get primaryVariant => const Color(0xFF1976D2);

  @override
  Color get onPrimary => Colors.black;

  // Secondary
  @override
  Color get secondary => const Color(0xFFFFD54F);

  @override
  Color get secondaryVariant => const Color(0xFFFFB300);

  @override
  Color get onSecondary => Colors.black;

  // Background / Surface
  @override
  Color get background => const Color(0xFF121212);

  @override
  Color get onBackground => const Color(0xFFF5F5F5);

  @override
  Color get surface => const Color(0xFF1E1E1E);

  @override
  Color get onSurface => const Color(0xFFF5F5F5);

  // Error
  @override
  Color get error => const Color(0xFFCF6679);

  @override
  Color get onError => Colors.black;

  // Neutral / Greyscale
  @override
  Color get textPrimary => const Color(0xFFF5F5F5);

  @override
  Color get textSecondary => const Color(0xFFBDBDBD);

  @override
  Color get textDisabled => const Color(0xFF757575);

  @override
  Color get border => const Color(0xFF424242);

  @override
  Color get divider => const Color(0xFF424242);

  // States
  @override
  Color get success => const Color(0xFF81C784);

  @override
  Color get warning => const Color(0xFFFFF176);

  @override
  Color get info => const Color(0xFF4FC3F7);

  // Misc
  @override
  Color get shimmerBase => const Color(0xFF424242);

  @override
  Color get shimmerHighlight => const Color(0xFF616161);
}


