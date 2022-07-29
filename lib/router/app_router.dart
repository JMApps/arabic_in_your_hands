import 'package:arabicinyourhands/pages/content_volume_one.dart';
import 'package:arabicinyourhands/pages/content_volume_two.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route appGeneratorRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/content_volume_one':
        return MaterialPageRoute(
            builder: (_) => const ContentVolumeOne(), settings: routeSettings);
      case '/content_volume_two':
        return MaterialPageRoute(
            builder: (_) => const ContentVolumeTwo(), settings: routeSettings);
      default:
        throw Exception('Invalid route ${routeSettings.name}');
    }
  }
}
