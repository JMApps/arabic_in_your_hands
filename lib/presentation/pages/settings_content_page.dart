import 'package:arabicinyourhands/presentation/widgets/content_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsContentPage extends StatelessWidget {
  const SettingsContentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки'),
        leading: Transform.scale(
          scale: 0.7,
          child: Image.asset('assets/icons/arabic_in_origin.png'),
        ),
      ),
      body: const CupertinoScrollbar(
        child: ContentSettings(),
      ),
    );
  }
}
