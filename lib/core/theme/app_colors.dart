import 'package:flutter/material.dart';

/// Base contract for all app color definitions.
///
/// To rebrand the app, edit only the implementations in `light_colors.dart`
/// and `dark_colors.dart`.
abstract class AppColors {
  // Primary
  Color get primary;
  Color get primaryVariant;
  Color get onPrimary;

  // Secondary / Accent
  Color get secondary;
  Color get secondaryVariant;
  Color get onSecondary;

  // Background / Surface
  Color get background;
  Color get onBackground;
  Color get surface;
  Color get onSurface;

  // Error
  Color get error;
  Color get onError;

  // Neutral / Greyscale
  Color get textPrimary;
  Color get textSecondary;
  Color get textDisabled;
  Color get border;
  Color get divider;

  // States
  Color get success;
  Color get warning;
  Color get info;

  // Misc
  Color get shimmerBase;
  Color get shimmerHighlight;
}
