import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  final AppColors colors;

  AppTextStyles(this.colors);

  TextStyle get displayLarge => TextStyle(
    fontSize: 57,
    fontWeight: FontWeight.w400,
    color: colors.textPrimary,
  );

  TextStyle get displayMedium => TextStyle(
    fontSize: 45,
    fontWeight: FontWeight.w400,
    color: colors.textPrimary,
  );

  TextStyle get displaySmall => TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w400,
    color: colors.textPrimary,
  );

  TextStyle get headlineLarge => TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w400,
    color: colors.textPrimary,
  );

  TextStyle get headlineMedium => TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w400,
    color: colors.textPrimary,
  );

  TextStyle get headlineSmall => TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    color: colors.textPrimary,
  );

  TextStyle get titleLarge => TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    color: colors.textPrimary,
  );

  TextStyle get titleMedium => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: colors.textPrimary,
  );

  TextStyle get titleSmall => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: colors.textPrimary,
  );

  TextStyle get bodyLarge => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: colors.textPrimary,
  );

  TextStyle get bodyMedium => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: colors.textPrimary,
  );

  TextStyle get bodySmall => TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: colors.textSecondary,
  );

  TextStyle get labelLarge => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: colors.textPrimary,
  );

  TextStyle get labelMedium => TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: colors.textSecondary,
  );

  TextStyle get labelSmall => TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: colors.textSecondary,
  );
}
