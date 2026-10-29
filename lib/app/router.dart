import 'package:flutter/material.dart';

import '../features/study/presentation/screens/catalog_screen.dart';

class AppRouter {
  static const String catalog = '/';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case catalog:
        return MaterialPageRoute<void>(
          builder: (_) => const CatalogScreen(),
          settings: settings,
        );
      default:
        return null;
    }
  }
}
