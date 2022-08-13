import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFCFD8DC),
    fontFamily: 'Gilroy',
    colorScheme: const ColorScheme.light(),
    primarySwatch: Colors.teal,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF263238),
      centerTitle: true,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontFamily: 'Gilroy',
      ),
    ),
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFF263238),
    fontFamily: 'Gilroy',
    colorScheme: const ColorScheme.dark(),
    primarySwatch: Colors.blueGrey,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF192226),
      centerTitle: true,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontFamily: 'Gilroy',
      ),
    ),
  );
}

extension ColorSchemeS on ColorScheme {
  Color get myAccentColor => brightness == Brightness.light
      ? const Color(0xFF00796B)
      : const Color(0xFF0098DA);

  Color get myPrimaryColor => brightness == Brightness.light
      ? const Color(0xFF263238)
      : const Color(0xFF1F4E5D);

  Color get bottomNavigationBarColor => brightness == Brightness.light
      ? const Color(0xFF263238)
      : const Color(0xFF192226);

  Color get bottomNavigationSettingItemColor => brightness == Brightness.light
      ? const Color(0xFFCFD8DC)
      : const Color(0xFF90A4AE);

  Color get bottomNavigationSelectedItemColor => brightness == Brightness.light
      ? const Color(0xFF1DE9B6)
      : const Color(0xFF00E5FF);

  Color get bottomNavigationUnSelectedItemColor =>
      brightness == Brightness.light
          ? const Color(0xFF009688)
          : const Color(0xFF0288D1);

  Color get mainChapterCardColor => brightness == Brightness.light
      ? const Color(0xFFF5F5F5)
      : const Color(0xFF192226);

  Color get titleChapterCardColor => brightness == Brightness.light
      ? const Color(0xFFD5FFEF)
      : const Color(0xFF19282D);

  Color get chapterNumberContainerColor => brightness == Brightness.light
      ? const Color(0xFF263238)
      : const Color(0xFF0288D1);

  Color get chapterIconColor => brightness == Brightness.light
      ? const Color(0xFF00796B)
      : const Color(0xFF03A9F4);

  Color get chapterTitleColor => brightness == Brightness.light
      ? const Color(0xFF263238)
      : const Color(0xFFE0E0E0);

  Color get chapterSubTitleColor => brightness == Brightness.light
      ? const Color(0xFF00796B)
      : const Color(0xFF40C4FF);

  Color get subChapterSelectedColor => brightness == Brightness.light
      ? const Color(0xFF263238)
      : const Color(0xFF1F4550);

  Color get subChapterUnSelectedOddColor => brightness == Brightness.light
      ? const Color(0xFF209372)
      : const Color(0xFF1C282C);

  Color get subChapterUnSelectedIsOddColor => brightness == Brightness.light
      ? const Color(0xFF28B78D)
      : const Color(0xFF192226);

  Color get subChapterFirstGradientColor => brightness == Brightness.light
      ? const Color(0xFFBEFFEF)
      : const Color(0xFF152C33);

  Color get subChapterSecondGradientColor => brightness == Brightness.light
      ? const Color(0xFFFFFFFF)
      : const Color(0xFF144756);

  Color get contentItemFirstLeftGradientColor => brightness == Brightness.light
      ? const Color(0xFFBEFFEF)
      : const Color(0xFF153946);

  Color get contentItemSecondLeftGradientColor => brightness == Brightness.light
      ? const Color(0xFFFAFAFA)
      : const Color(0xFF132F3B);

  Color get contentItemFirstRightGradientColor => brightness == Brightness.light
      ? const Color(0xBFBEEBFF)
      : const Color(0xFF2C3E42);

  Color get contentItemSecondRightGradientColor =>
      brightness == Brightness.light
          ? const Color(0xFFFAFAFA)
          : const Color(0xFF192226);

  Color get contentItemFirstSelectedGradientColor =>
      brightness == Brightness.light
          ? const Color(0xBFFFEABD)
          : const Color(0xFF2F2B1E);

  Color get contentItemSecondSelectedGradientColor =>
      brightness == Brightness.light
          ? const Color(0xFFFFFFFF)
          : const Color(0xFF262219);

  Color get fabDictionaryColor => brightness == Brightness.light
      ? const Color(0xFF209372)
      : const Color(0xFF18708A);

  Color get flipFrontColor => brightness == Brightness.light
      ? const Color(0xFFFFFDE7)
      : const Color(0xFF262419);

  Color get flipBackColor => brightness == Brightness.light
      ? const Color(0xFFF5F5F5)
      : const Color(0xFF182325);

  Color get priorityWithoutColor => brightness == Brightness.light
      ? const Color(0xFF9E9E9E)
      : const Color(0xFF424242);

  Color get priorityLowColor => brightness == Brightness.light
      ? const Color(0xFFFFB74D)
      : const Color(0xFFF57C00);

  Color get priorityHighColor => brightness == Brightness.light
      ? const Color(0xFF4DB6AC)
      : const Color(0xFF00796B);

  Color get priorityMediumColor => brightness == Brightness.light
      ? const Color(0xFFE57373)
      : const Color(0xFFD32F2F);
}
