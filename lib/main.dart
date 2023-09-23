import 'dart:io';

import 'package:arabicinyourhands/core/colors/app_colors.dart';
import 'package:arabicinyourhands/core/state/provider/content_settings_state.dart';
import 'package:arabicinyourhands/core/state/provider/dictionary_content_state.dart';
import 'package:arabicinyourhands/core/state/provider/play_speed_state.dart';
import 'package:arabicinyourhands/core/state/provider/volume_content_dialog_visibility_state.dart';
import 'package:arabicinyourhands/core/strings/app_constraints.dart';
import 'package:arabicinyourhands/presentation/pages/root_page.dart';
import 'package:arabicinyourhands/presentation/uiState/main_navigation_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

final globalBucketFirstVolumeChapters = PageStorageBucket();

final globalBucketSecondVolumeChapters = PageStorageBucket();
final globalBucketSecondVolumeSubChapters = PageStorageBucket();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        systemNavigationBarColor: AppColors.transparent,
      ),
    );
  }
  await Hive.initFlutter();
  await Hive.openBox(AppConstraints.keyMainSettingBox);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MainNavigationState(),
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
        ChangeNotifierProvider(
          create: (_) => DictionaryContentState(),
        ),
      ],
      child: const RootPage(),
    ),
  );
}
