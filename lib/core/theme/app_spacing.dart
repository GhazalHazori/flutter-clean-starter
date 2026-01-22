/// Global spacing tokens for padding, margin, gaps, and radii.
///
/// No widget should use numeric literals for spacing. Always consume these
/// constants to ensure consistent layout across the app.
class AppSpacing {
  AppSpacing._();

  // Padding / Margin
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 20;
  static const double xxl = 24;

  // Corner radius
  static const double radiusXs = 4;
  static const double radiusSm = 8;
  static const double radiusMd = 12;
  static const double radiusLg = 16;

  // Icon sizes
  static const double iconSm = 16;
  static const double iconMd = 20;
  static const double iconLg = 24;

  // Elevation
  static const double elevationSm = 2;
  static const double elevationMd = 4;
  static const double elevationLg = 8;
}


