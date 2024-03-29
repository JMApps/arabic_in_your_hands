import 'package:arabicinyourhands/presentation/pages/arabicDictionary/arabic_dictionary_page.dart';
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
  static const EdgeInsets mainMardingWithoutTop = EdgeInsets.only(left: 16, bottom: 16, right: 16);
  static const EdgeInsets mainMardingWithoutTopMini = EdgeInsets.only(left: 8, bottom: 8, right: 8);
  static const EdgeInsets mainMardingWithoutBottom = EdgeInsets.only(left: 16, top: 16, right: 16);
  static const EdgeInsets mainMardingWithoutBottomMini = EdgeInsets.only(left: 8, top: 8, right: 8);

  static const RoundedRectangleBorder mainShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(12.5),
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
    ArabicDictionaryPage(),
    DictionaryCategoriesPage(),
    SettingsContentPage(),
  ];

  static const List<String> contentArabicFontList = [
    'Scheherazade',
    'Lateef',
    'Markazi',
  ];

  static const List<String> contentTranslationFontList = [
    'Gilroy',
    'Roboto',
    'Montserrat',
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
