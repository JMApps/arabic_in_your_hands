import 'package:arabicinyourhands/application/main_page.dart';
import 'package:arabicinyourhands/domain/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

final globalBucketSecondVolumeChapters = PageStorageBucket();
final globalBucketSecondVolumeSubChapters = PageStorageBucket();

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  await Hive.initFlutter();
  await Hive.openBox(Constants.keyMainSettingBox);
  runApp(
    const MainPage(),
  );
}
