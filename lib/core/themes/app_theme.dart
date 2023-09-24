import 'package:arabicinyourhands/core/colors/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: const Color(0xFF202C31),
      secondary: const Color(0xFF166551),
    ),
    useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xFFCFD8DC),
    fontFamily: 'Montserrat',
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(
        color: AppColors.whiteColor,
      ),
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontFamily: 'Montserrat',
        color: AppColors.whiteColor,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      alignLabelWithHint: true,
      floatingLabelAlignment: FloatingLabelAlignment.center,
      border: InputBorder.none,
    ),
  );

  static final darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color(0xFF192226),
      secondary: const Color(0xFF0B8FE8),
    ),
    useMaterial3: true,
    scaffoldBackgroundColor: const Color(0xFF202C31),
    fontFamily: 'Montserrat',
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(
        color: AppColors.whiteColor,
      ),
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontFamily: 'Montserrat',
        color: AppColors.whiteColor,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      alignLabelWithHint: true,
      floatingLabelAlignment: FloatingLabelAlignment.center,
      border: InputBorder.none,
    ),
  );
}

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

extension ColorSchemeS on ColorScheme {
  Color get primaryColor => brightness == Brightness.light
      ? const Color(0xFF202C31)
      : const Color(0xFF192226);

  Color get primaryDark => brightness == Brightness.light
      ? const Color(0xFF2C3F42)
      : const Color(0xFF346384);

  Color get mainIconColor => brightness == Brightness.light
      ? const Color(0xFF166551)
      : const Color(0xFF0B8FE8);

  Color get selectedSideColor => brightness == Brightness.light
      ? const Color(0xFF202C31)
      : const Color(0xFF0B8FE8);

  Color get lightAccent => brightness == Brightness.light
      ? const Color(0xFF1DE9B6)
      : const Color(0xFF26A2FF);

  Color get titleChapterCardColor => brightness == Brightness.light
      ? const Color(0xFFD5FFEF)
      : const Color(0xFF192226);

  Color get subTitleChapterCardColor => brightness == Brightness.light
      ? const Color(0xFF209372)
      : const Color(0xFF192226);

  Color get mainCardColor => brightness == Brightness.light
      ? const Color(0xFFFFFFFF)
      : const Color(0xFF202C31);

  Color get leftDialogColor => brightness == Brightness.light
      ? const Color(0xFF166551)
      : const Color(0xFF0B8FE8);

  Color get rightDialogColor => brightness == Brightness.light
      ? const Color(0xFF0B8FE8)
      : const Color(0xFF209372);

  LinearGradient get mainGradient => brightness == Brightness.light
      ? const LinearGradient(
          colors: [
            Color(0xFFB2DFDB),
            Color(0xFFFFFFFF),
          ],
        )
      : const LinearGradient(
          colors: [
            Color(0xFF192226),
            Color(0xFF192226),
          ],
        );
}
