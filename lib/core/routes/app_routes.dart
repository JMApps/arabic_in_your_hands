import 'package:arabicinyourhands/data/database/model/dictionary_category_arguments.dart';
import 'package:arabicinyourhands/data/database/model/dictionary_words_flip_arguments.dart';
import 'package:arabicinyourhands/data/database/model/volume_first_item_flip_content_arguments.dart';
import 'package:arabicinyourhands/data/database/model/volume_second_item_flip_content_arguments.dart';
import 'package:arabicinyourhands/domain/arguments/first_sub_chapter_args.dart';
import 'package:arabicinyourhands/presentation/pages/dictionary_words_page.dart';
import 'package:arabicinyourhands/presentation/pages/firstVolume/first_vol_contents_page.dart';
import 'package:arabicinyourhands/presentation/pages/first_volume_content_flip_mode_page.dart';
import 'package:arabicinyourhands/presentation/pages/second_volume_content_flip_mode_page.dart';
import 'package:arabicinyourhands/presentation/pages/words_content_flip_mode_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route appGeneratorRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/first_vol_contents_page':
        final FirstSubChapterArgs firstSubChapterArgs = routeSettings.arguments as FirstSubChapterArgs;
        return MaterialPageRoute(
          builder: (_) => FirstVolContentsPage(firstVolSubChapterModel: firstSubChapterArgs.model), settings: routeSettings);
      case '/first_volume_content_flip':
        final VolumeFirstItemFlipContentArguments flipContentArguments =
            routeSettings.arguments as VolumeFirstItemFlipContentArguments;
        return MaterialPageRoute(
            builder: (_) => FirstVolumeContentFlipModePage(
                  firstVolumeSubChapterId:
                      flipContentArguments.firstVolumeSubChapterId,
                  dialogTitle: flipContentArguments.dialogTitle,
                ),
            settings: routeSettings);
      // case '/second_vol_contents_page':
      //   final SecondSubChapterArgs secondSubChapterArgs = routeSettings.arguments as SecondSubChapterArgs;
      //   return MaterialPageRoute(builder: (_) => FirstVolContentsPage(firstVolSubChapterModel: secondSubChapterArgs.model), settings: routeSettings);
      case '/second_volume_content_flip':
        final VolumeSecondItemFlipContentArguments flipContentArguments =
            routeSettings.arguments as VolumeSecondItemFlipContentArguments;
        return MaterialPageRoute(
            builder: (_) => SecondVolumeContentFlipModePage(
                  secondVolumeSubChapterId:
                      flipContentArguments.secondVolumeSubChapterId,
                  dialogTitle: flipContentArguments.dialogTitle,
                ),
            settings: routeSettings);
      case '/category_words_content':
        final DictionaryCategoryArguments dictionaryCategoryArguments =
            routeSettings.arguments as DictionaryCategoryArguments;
        return MaterialPageRoute(
            builder: (_) => DictionaryWordsPage(
                  categoryId: dictionaryCategoryArguments.categoryId,
                  categoryTitle: dictionaryCategoryArguments.categoryTitle,
                  categoryColor: dictionaryCategoryArguments.categoryColor,
                  categoryPriority:
                      dictionaryCategoryArguments.categoryPriority,
                ),
            settings: routeSettings);
      case '/words_content_flip':
        final DictionaryWordFlipArguments dictionaryWordFlipArguments =
            routeSettings.arguments as DictionaryWordFlipArguments;
        return MaterialPageRoute(
            builder: (_) => WordsContentFlipModePage(
                  wordsCategoryId: dictionaryWordFlipArguments.wordsCategoryId,
                  wordsCategoryTitle:
                      dictionaryWordFlipArguments.wordsCategoryTitle,
                  wordsCategoryPriority:
                      dictionaryWordFlipArguments.wordsCategoryPriority,
                ),
            settings: routeSettings);
      default:
        throw Exception('Invalid route ${routeSettings.name}');
    }
  }
}
