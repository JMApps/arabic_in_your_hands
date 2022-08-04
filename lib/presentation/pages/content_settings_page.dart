import 'package:arabicinyourhands/presentation/widgets/content_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContentSettingsPage extends StatelessWidget {
  const ContentSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.maxFinite, 50),
        child: AppBar(
          centerTitle: true,
          title: const Text('Настройки'),
          backgroundColor: const Color(0xFF243743),
        ),
      ),
      body: const CupertinoScrollbar(
        child: ContentSettings(),
      ),
    );
  }
}
