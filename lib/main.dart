import 'package:arabicinyourhands/provider/app_list_index_state.dart';
import 'package:arabicinyourhands/provider/content_player_state.dart';
import 'package:arabicinyourhands/provider/content_settings_state.dart';
import 'package:arabicinyourhands/provider/main_bottom_navigation_state.dart';
import 'package:arabicinyourhands/provider/sub_chapter_selected_item_state.dart';
import 'package:arabicinyourhands/provider/volume_content_dialog_visibility_state.dart';
import 'package:arabicinyourhands/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  Main({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppListIndexState()),
        ChangeNotifierProvider(create: (_) => MainBottomNavigationState()),
        ChangeNotifierProvider(create: (_) => VolumeContentDialogVisibilityState()),
        ChangeNotifierProvider(create: (_) => ContentSettingsState()),
        ChangeNotifierProvider(create: (_) => ContentPlayerState()),
        ChangeNotifierProvider(create: (_) => SubChapterSelectedItemState()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Арабский перед тобой',
        theme: ThemeData(primarySwatch: Colors.blueGrey, fontFamily: 'Gilroy'),
        onGenerateRoute: _appRouter.appGeneratorRoute,
        initialRoute: '/',
      ),
    );
  }
}
