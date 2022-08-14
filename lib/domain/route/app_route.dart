import 'package:arabicinyourhands/data/database/model/content_volume_one_arguments.dart';
import 'package:arabicinyourhands/data/database/model/content_volume_two_arguments.dart';
import 'package:arabicinyourhands/data/database/model/dictionary_category_arguments.dart';
import 'package:arabicinyourhands/data/database/model/volume_first_item_flip_content_arguments.dart';
import 'package:arabicinyourhands/data/database/model/volume_second_item_flip_content_arguments.dart';
import 'package:arabicinyourhands/presentation/pages/dictionary_words_page.dart';
import 'package:arabicinyourhands/presentation/pages/first_volume_content_flip_mode_page.dart';
import 'package:arabicinyourhands/presentation/pages/first_volume_sub_chapter_content_page.dart';
import 'package:arabicinyourhands/presentation/pages/second_volume_content_flip_mode_page.dart';
import 'package:arabicinyourhands/presentation/pages/second_volume_sub_chapter_content_page.dart';
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
        final VolumeFirstItemFlipContentArguments flipContentArguments = routeSettings.arguments as VolumeFirstItemFlipContentArguments;
        return MaterialPageRoute(
            builder: (_) => FirstVolumeContentFlipModePage(
                  firstVolumeSubChapterId: flipContentArguments.firstVolumeSubChapterId,
                  dialogTitle: flipContentArguments.dialogTitle,
                ),
            settings: routeSettings);
      case '/second_volume_content':
        final ContentVolumeTwoArguments secondVolArguments = routeSettings.arguments as ContentVolumeTwoArguments;
        return MaterialPageRoute(
            builder: (_) => SecondVolumeSubChapterContentPage(
                  secondVolumeChapterId: secondVolArguments.secondVolumeChapterId,
                  secondVolumeSubChapterId: secondVolArguments.secondVolumeSubChapterId,
                  secondVolumeSubChapterIndex: secondVolArguments.secondVolumeSubChapterIndex,
                ),
            settings: routeSettings);
      case '/second_volume_content_flip':
        final VolumeSecondItemFlipContentArguments flipContentArguments = routeSettings.arguments as VolumeSecondItemFlipContentArguments;
        return MaterialPageRoute(
            builder: (_) => SecondVolumeContentFlipModePage(
                  secondVolumeSubChapterId: flipContentArguments.secondVolumeSubChapterId,
                  dialogTitle: flipContentArguments.dialogTitle,
                ),
            settings: routeSettings);
      case '/category_words_content':
        final DictionaryCategoryArguments dictionaryCategoryArguments = routeSettings.arguments as DictionaryCategoryArguments;
        return MaterialPageRoute(
            builder: (_) => DictionaryWordsPage(
              categoryId: dictionaryCategoryArguments.categoryId,
              categoryTitle: dictionaryCategoryArguments.categoryTitle,
            ),
            settings: routeSettings);
      default:
        throw Exception('Invalid route ${routeSettings.name}');
    }
  }
}
