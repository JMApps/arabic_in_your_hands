import 'package:arabicinyourhands/core/routes/app_routes.dart';
import 'package:arabicinyourhands/core/themes/app_theme.dart';
import 'package:arabicinyourhands/presentation/pages/main_page.dart';
import 'package:arabicinyourhands/presentation/uiState/content_settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ContentSettingsState settings = Provider.of<ContentSettingsState>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateTitle: (context) => AppLocalizations.of(context)!.app_name,
      onGenerateRoute: AppRoutes.appGeneratorRoute,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: settings.getAdaptiveTheme
          ? ThemeMode.system
          : settings.getDarkTheme
          ? ThemeMode.dark
          : ThemeMode.light,
      home: const MainPage(),
    );
  }
}
