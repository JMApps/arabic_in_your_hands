import 'package:arabicinyourhands/pages/content_volume_one.dart';
import 'package:arabicinyourhands/pages/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route appGeneratorRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => MainPage(), settings: routeSettings);
      case '/content_volume_one':
        return MaterialPageRoute(
            builder: (_) => ContentVolumeOne(), settings: routeSettings);
      default:
        throw Exception('Invalid route');
    }
  }
}
