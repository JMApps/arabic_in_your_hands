import 'package:arabicinyourhands/domain/arguments/collection_args.dart';
import 'package:arabicinyourhands/domain/arguments/first_sub_chapter_args.dart';
import 'package:arabicinyourhands/domain/arguments/second_sub_chapter_args.dart';
import 'package:arabicinyourhands/domain/arguments/word_category_args.dart';
import 'package:arabicinyourhands/presentation/pages/arabicDictionary/collection_detail_flip_page.dart';
import 'package:arabicinyourhands/presentation/pages/arabicDictionary/collection_detail_page.dart';
import 'package:arabicinyourhands/presentation/pages/firstVolume/first_vol_contents_flip_page.dart';
import 'package:arabicinyourhands/presentation/pages/firstVolume/first_vol_contents_page.dart';
import 'package:arabicinyourhands/presentation/pages/seconVolume/second_vol_contents_flip_page.dart';
import 'package:arabicinyourhands/presentation/pages/seconVolume/second_vol_contents_page.dart';
import 'package:arabicinyourhands/presentation/pages/userDictionary/dictionary_words_page.dart';
import 'package:arabicinyourhands/presentation/pages/userDictionary/words_content_flip_mode_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route appGeneratorRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      // Fisrt volume
      case '/first_vol_contents_page':
        final FirstSubChapterArgs firstSubChapterArgs =
            routeSettings.arguments as FirstSubChapterArgs;
        return MaterialPageRoute(
          builder: (_) => FirstVolContentsPage(
            firstVolSubChapterEntity: firstSubChapterArgs.model,
          ),
          settings: routeSettings,
        );
      case '/first_vol_contents_flip_page':
        final FirstSubChapterArgs firstSubChapterArgs =
            routeSettings.arguments as FirstSubChapterArgs;
        return MaterialPageRoute(
          builder: (_) => FirstVolContentsFlipPage(
            firstVolSubChapterEntity: firstSubChapterArgs.model,
          ),
          settings: routeSettings,
        );

      // Second volume
      case '/second_vol_contents_page':
        final SecondSubChapterArgs secondubChapterArgs =
            routeSettings.arguments as SecondSubChapterArgs;
        return MaterialPageRoute(
          builder: (_) => SecondVolContentsPage(
            secondVolSubChapterEntity: secondubChapterArgs.model,
          ),
          settings: routeSettings,
        );
      case '/second_vol_contents_flip_page':
        final SecondSubChapterArgs secondubChapterArgs =
            routeSettings.arguments as SecondSubChapterArgs;
        return MaterialPageRoute(
          builder: (_) => SecondVolContentsFlipPage(
            secondVolSubChapterEntity: secondubChapterArgs.model,
          ),
          settings: routeSettings,
        );

      // User words
      case '/category_words_content':
        final WordCategoryArgs wordCategoryArgs =
            routeSettings.arguments as WordCategoryArgs;
        return MaterialPageRoute(
          builder: (_) => DictionaryWordsPage(
            categoryModel: wordCategoryArgs.model,
          ),
          settings: routeSettings,
        );
      case '/words_content_flip':
        final WordCategoryArgs wordCategoryArgs =
            routeSettings.arguments as WordCategoryArgs;
        return MaterialPageRoute(
          builder: (_) => WordsContentFlipModePage(
            categoryModel: wordCategoryArgs.model,
          ),
          settings: routeSettings,
        );

      // Collections
      case '/collection_detail_page':
        final CollectionArgs collectionArgs =
        routeSettings.arguments as CollectionArgs;
        return MaterialPageRoute(
          builder: (_) => CollectionDetailPage(
            model: collectionArgs.model,
          ),
          settings: routeSettings,
        );
      case '/collection_detail_flip_page':
        final CollectionArgs collectionArgs =
        routeSettings.arguments as CollectionArgs;
        return MaterialPageRoute(
          builder: (_) => CollectionDetailFlipPage(
            model: collectionArgs.model,
          ),
          settings: routeSettings,
        );
      default:
        throw Exception('Invalid route ${routeSettings.name}');
    }
  }
}
