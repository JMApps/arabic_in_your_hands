import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'core/strings/app_constraints.dart';
import 'data/state/collection_state.dart';
import 'data/state/user_dictionary_category_state.dart';
import 'data/state/user_dictionary_word_state.dart';
import 'data/state/word_collection_state.dart';
import 'presentation/pages/root_page.dart';
import 'presentation/uiState/content_settings_state.dart';
import 'presentation/uiState/dialog_show_state.dart';
import 'presentation/uiState/main_navigation_state.dart';
import 'presentation/uiState/player/play_speed_state.dart';

final PageStorageBucket globalBucketFirstVolumeChapters = PageStorageBucket();
final PageStorageBucket globalBucketFirstVolumeSubChapters = PageStorageBucket();

final PageStorageBucket globalBucketSecondVolumeChapters = PageStorageBucket();
final PageStorageBucket globalBucketSecondVolumeSubChapters = PageStorageBucket();

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(AppConstraints.keyMainSettingBox);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainNavigationState()),
        ChangeNotifierProvider(create: (_) => DialogShowState()),
        ChangeNotifierProvider(create: (_) => ContentSettingsState()),
        ChangeNotifierProvider(create: (_) => UserDictionaryCategoryState()),
        ChangeNotifierProvider(create: (_) => UserDictionaryWordState()),
        ChangeNotifierProvider(create: (_) => CollectionState()),
        ChangeNotifierProvider(create: (_) => WordCollectionState()),
        ChangeNotifierProvider(create: (_) => PlaySpeedState()),
      ],
      child: const RootPage(),
    ),
  );
}
