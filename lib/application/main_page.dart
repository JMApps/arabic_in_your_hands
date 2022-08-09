import 'package:arabicinyourhands/domain/route/app_route.dart';
import 'package:arabicinyourhands/domain/state/provider/content_settings_state.dart';
import 'package:arabicinyourhands/domain/state/provider/main_navigation_selected_state.dart';
import 'package:arabicinyourhands/domain/state/provider/play_speed_state.dart';
import 'package:arabicinyourhands/domain/state/provider/volume_content_dialog_visibility_state.dart';
import 'package:arabicinyourhands/domain/theme/app_theme.dart';
import 'package:arabicinyourhands/presentation/pages/main_page_body.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _appRouter = AppRoute();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MainNavigationSelectedState(),
        ),
        ChangeNotifierProvider(
          create: (_) => ContentSettingsState(),
        ),
        ChangeNotifierProvider(
          create: (_) => VolumeContentDialogVisibilityState(),
        ),
        ChangeNotifierProvider(
          create: (_) => PlaySpeedState(),
        ),
      ],
      child: Builder(
        builder: (context) {
          context.read<ContentSettingsState>().initSettings();
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Арабский перед тобой',
            themeMode: context.watch<ContentSettingsState>().getThemeMode,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            onGenerateRoute: _appRouter.appGeneratorRoute,
            home: MainPageBody(),
          );
        }
      ),
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
