import 'package:arabicinyourhands/presentation/pages/userDictionary/dictionary_categories_page.dart';
import 'package:arabicinyourhands/presentation/pages/firstVolume/first_vol_chapters_page.dart';
import 'package:arabicinyourhands/presentation/pages/seconVolume/second_vol_chapters_page.dart';
import 'package:arabicinyourhands/presentation/pages/settings_content_page.dart';
import 'package:flutter/cupertino.dart';

class AppStyles {
  static const EdgeInsets mainMarding = EdgeInsets.all(16);
  static const EdgeInsets mainMardingMini = EdgeInsets.all(8);
  static const EdgeInsets mainMardingHorizontal = EdgeInsets.symmetric(horizontal: 16);
  static const EdgeInsets mainMardingHorizontalMini = EdgeInsets.symmetric(horizontal: 8);
  static const EdgeInsets mainMardingVertical = EdgeInsets.symmetric(vertical: 16);
  static const EdgeInsets mainMardingVerticalMini = EdgeInsets.symmetric(vertical: 8);

  static const RoundedRectangleBorder mainShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(20),
    ),
  );

  static const RoundedRectangleBorder mainShapeMini = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(12.5),
    ),
  );

  static const BorderRadius mainBorder = BorderRadius.all(
    Radius.circular(12.5),
  );

  static const BorderRadius mainBorderMini = BorderRadius.all(
    Radius.circular(12.5),
  );

  static const List<Widget> mainPages = <Widget>[
    FirstVolChaptersPage(),
    SecondVolChaptersPage(),
    DictionaryCategoriesPage(),
    SettingsContentPage(),
  ];

  static const List<String> contentArabicFontList = [
    'Font 1',
    'Font 2',
    'Font 3',
  ];

  static const List<String> contentTranslationFontList = [
    'Font 1',
    'Font 2',
    'Font 3',
  ];

  static const List<TextAlign> contentArabicFontAlign = [
    TextAlign.end,
    TextAlign.center,
    TextAlign.start,
    TextAlign.justify,
  ];

  static const List<TextAlign> contentTranslationFontAlign = [
    TextAlign.start,
    TextAlign.center,
    TextAlign.end,
    TextAlign.justify,
  ];

  static const TextStyle mainTextStyle = TextStyle(fontSize: 18);
}
