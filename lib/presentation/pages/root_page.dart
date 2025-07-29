import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/routes/app_routes.dart';
import '../../core/themes/app_theme.dart';
import '../../l10n/app_localizations.dart';
import '../uiState/content_settings_state.dart';
import 'main_page.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ContentSettingsState settings = Provider.of<ContentSettingsState>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appName,
      onGenerateRoute: AppRoutes.appGeneratorRoute,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: settings.getAdaptiveTheme ? ThemeMode.system : settings.getDarkTheme ? ThemeMode.dark : ThemeMode.light,
      builder: (context, child) {
        final bottomInset = MediaQuery.of(context).viewPadding.bottom;
        final needsBottomPadding = Platform.isAndroid && bottomInset > 0;

        return Padding(
          padding: EdgeInsets.only(bottom: needsBottomPadding ? bottomInset : 0),
          child: child!,
        );
      },
      home: const MainPage(),
    );
  }
}
