import 'package:arabicinyourhands/presentation/pages/content_volume_one.dart';
import 'package:arabicinyourhands/presentation/pages/content_volume_two.dart';
import 'package:flutter/material.dart';

class AppRoute {
  Route appGeneratorRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/content_volume_one':
        //final ContentVolumeOneArguments contentVolumeOneArguments = routeSettings.arguments;
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
