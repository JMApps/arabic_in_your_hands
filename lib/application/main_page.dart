import 'package:arabicinyourhands/domain/route/app_route.dart';
import 'package:arabicinyourhands/domain/state/provider/content_player_state.dart';
import 'package:arabicinyourhands/domain/state/provider/content_settings_state.dart';
import 'package:arabicinyourhands/domain/state/provider/main_navigation_selected_state.dart';
import 'package:arabicinyourhands/domain/state/provider/volume_content_dialog_visibility_state.dart';
import 'package:arabicinyourhands/presentation/pages/main_page_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final _appRouter = AppRoute();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainNavigationSelectedState()),
        ChangeNotifierProvider(create: (_) => VolumeContentDialogVisibilityState()),
        ChangeNotifierProvider(create: (_) => ContentSettingsState()),
        ChangeNotifierProvider(create: (_) => ContentPlayerState()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Арабский перед тобой',
        theme: ThemeData(primarySwatch: Colors.blueGrey, fontFamily: 'Gilroy'),
        onGenerateRoute: _appRouter.appGeneratorRoute,
        home: MainPageBody(),
      ),
    );
  }
}
