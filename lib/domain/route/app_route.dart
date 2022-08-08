import 'package:arabicinyourhands/data/database/model/content_volume_one_arguments.dart';
import 'package:arabicinyourhands/data/database/model/volume_first_item_flip_content_arguments.dart';
import 'package:arabicinyourhands/presentation/pages/first_volume_content_flip_mode_page.dart';
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
                  firstVolumeSubChapterId: firstVolArguments.firstVolumeSubChapterId,
                  firstVolumeSubChapterIndex: firstVolArguments.firstVolumeSubChapterIndex,
                ),
            settings: routeSettings);
      case '/first_volume_content_flip':
        final VolumeFirstItemFlipContentArguments flipContentArguments =
            routeSettings.arguments as VolumeFirstItemFlipContentArguments;
        return MaterialPageRoute(
            builder: (_) => FirstVolumeContentFlipModePage(
                  firstVolumeSubChapterId: flipContentArguments.firstVolumeSubChapterId,
                  dialogTitle: flipContentArguments.dialogTitle,
                ),
            settings: routeSettings);
      default:
        throw Exception('Invalid route ${routeSettings.name}');
    }
  }
}
