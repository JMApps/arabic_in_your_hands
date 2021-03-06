import 'package:arabicinyourhands/data/database/model/content_volume_one_arguments.dart';
import 'package:arabicinyourhands/presentation/pages/fist_volume_sub_chapter_content_page.dart';
import 'package:flutter/material.dart';

class AppRoute {
  Route appGeneratorRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/first_volume_content':
        final ContentVolumeOneArguments firstVolArguments =
            routeSettings.arguments as ContentVolumeOneArguments;
        return MaterialPageRoute(
            builder: (_) => FistVolumeSubChapterContentPage(
                  firstVolumeChapterId: firstVolArguments.firstVolumeChapterId,
                  firstVolumeSubChapterIndex: firstVolArguments.firstVolumeSubChapterIndex,
                ),
            settings: routeSettings);
      // case '/content_volume_two':
      //   return MaterialPageRoute(
      //       builder: (_) => const ContentVolumeTwo(), settings: routeSettings);
      default:
        throw Exception('Invalid route ${routeSettings.name}');
    }
  }
}
