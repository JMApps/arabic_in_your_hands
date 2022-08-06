import 'package:arabicinyourhands/domain/state/provider/content_settings_state.dart';
import 'package:arabicinyourhands/domain/state/provider/main_navigation_selected_state.dart';
import 'package:arabicinyourhands/presentation/lists/first_volume_chapter_list.dart';
import 'package:arabicinyourhands/presentation/lists/second_volume_chapter_list.dart';
import 'package:arabicinyourhands/presentation/pages/dictionary.dart';
import 'package:arabicinyourhands/presentation/widgets/content_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainPageBody extends StatelessWidget {
  MainPageBody({Key? key}) : super(key: key);

  final _mainWidgets = [
    FirstVolumeChapterList(),
    SecondVolumeChapterList(),
    Dictionary(),
    const ContentSettings(),
  ];

  final _mainTitles = [
    'Том 1',
    'Том 2',
    'Словарь',
    'Настройки',
  ];

  @override
  Widget build(BuildContext context) {
    context.read<ContentSettingsState>().initSettings();
    return Scaffold(
      backgroundColor: const Color(0xFFE8E8E8),
      appBar: AppBar(
        title: Text(
          _mainTitles[
              context.watch<MainNavigationSelectedState>().getSelectedIndex],
        ),
        backgroundColor: const Color(0xFF243743),
        leading: Transform.scale(
          scale: 0.7,
          child: Image.asset('assets/icons/arabic_in_origin.png'),
        ),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        switchInCurve: Curves.easeInCubic,
        switchOutCurve: Curves.easeOutCubic,
        child: _mainWidgets[
            context.watch<MainNavigationSelectedState>().getSelectedIndex],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF243743),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: SalomonBottomBar(
          items: [
            SalomonBottomBarItem(
              icon: const Icon(Icons.filter_1_outlined),
              title: const Text('Том 1'),
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.filter_2_outlined),
              title: const Text('Том 2'),
            ),
            SalomonBottomBarItem(
              icon: const Icon(CupertinoIcons.add),
              title: const Text('Словарь'),
            ),
            SalomonBottomBarItem(
              icon: const Icon(
                CupertinoIcons.settings,
                color: Colors.white,
              ),
              title: const Text(
                'Настройки',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
          itemShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.5),
          ),
          selectedItemColor: const Color(0xFF37FFC2),
          unselectedItemColor: const Color(0xFF1F8D6E),
          currentIndex:
              context.watch<MainNavigationSelectedState>().getSelectedIndex,
          onTap: (currentIndex) {
            context.read<MainNavigationSelectedState>().changeBottomNavigationIndex(currentIndex);
          },
        ),
      ),
    );
  }
}
