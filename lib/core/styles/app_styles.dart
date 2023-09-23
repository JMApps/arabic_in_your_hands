import 'package:arabicinyourhands/presentation/pages/dictionary_categories_page.dart';
import 'package:arabicinyourhands/presentation/pages/first_volume_content_page.dart';
import 'package:arabicinyourhands/presentation/pages/second_volume_content_page.dart';
import 'package:arabicinyourhands/presentation/pages/settings_content_page.dart';
import 'package:flutter/cupertino.dart';

class AppStyles {
  static const EdgeInsets mainMarding = EdgeInsets.all(16);
  static const EdgeInsets mainMardingMini = EdgeInsets.all(8);

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
    Radius.circular(20),
  );

  static const BorderRadius mainBorderMini = BorderRadius.all(
    Radius.circular(12.5),
  );

  static const List<Widget> mainPages = <Widget>[
    FirstVolumeContentPage(),
    SecondVolumeContentPage(),
    DictionaryCategoriesPage(),
    SettingsContentPage(),
  ];
}
