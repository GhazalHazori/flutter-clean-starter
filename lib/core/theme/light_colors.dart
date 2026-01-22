import 'package:flutter/material.dart';

import 'app_colors.dart';

class LightColors extends AppColors {
  // Primary
  @override
  Color get primary => const Color(0xFF0066CC);

  @override
  Color get primaryVariant => const Color(0xFF004999);

  @override
  Color get onPrimary => Colors.white;

  // Secondary
  @override
  Color get secondary => const Color(0xFFFFA000);

  @override
  Color get secondaryVariant => const Color(0xFFCC8000);

  @override
  Color get onSecondary => Colors.white;

  // Background / Surface
  @override
  Color get background => const Color(0xFFF5F5F5);

  @override
  Color get onBackground => const Color(0xFF121212);

  @override
  Color get surface => Colors.white;

  @override
  Color get onSurface => const Color(0xFF121212);

  // Error
  @override
  Color get error => const Color(0xFFB00020);

  @override
  Color get onError => Colors.white;

  // Neutral / Greyscale
  @override
  Color get textPrimary => const Color(0xFF121212);

  @override
  Color get textSecondary => const Color(0xFF4F4F4F);

  @override
  Color get textDisabled => const Color(0xFF9E9E9E);

  @override
  Color get border => const Color(0xFFE0E0E0);

  @override
  Color get divider => const Color(0xFFE0E0E0);

  // States
  @override
  Color get success => const Color(0xFF2E7D32);

  @override
  Color get warning => const Color(0xFFF9A825);

  @override
  Color get info => const Color(0xFF0288D1);

  // Misc
  @override
  Color get shimmerBase => const Color(0xFFE0E0E0);

  @override
  Color get shimmerHighlight => const Color(0xFFF5F5F5);
}


