import 'package:flutter/material.dart';

import '../features/sample_feature/presentation/pages/sample_page.dart';

class AppRouter {
  static const String initialRoute = SamplePage.routeName;

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SamplePage.routeName:
        return MaterialPageRoute(
          builder: (_) => const SamplePage(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const SamplePage(),
          settings: settings,
        );
    }
  }
}


