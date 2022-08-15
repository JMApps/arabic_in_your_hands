import 'package:arabicinyourhands/domain/state/provider/main_navigation_selected_state.dart';
import 'package:arabicinyourhands/domain/theme/app_theme.dart';
import 'package:arabicinyourhands/presentation/pages/dictionary_content_page.dart';
import 'package:arabicinyourhands/presentation/pages/first_volume_content_page.dart';
import 'package:arabicinyourhands/presentation/pages/second_volume_content_page.dart';
import 'package:arabicinyourhands/presentation/pages/settings_content_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainPageBody extends StatelessWidget {
  MainPageBody({Key? key}) : super(key: key);

  final _mainWidgets = [
    const FirstVolumeContentPage(),
    const SecondVolumeContentPage(),
    const DictionaryContentPage(),
    const SettingsContentPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme;
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        switchInCurve: Curves.easeInCubic,
        switchOutCurve: Curves.easeOutCubic,
        child: _mainWidgets[
            context.watch<MainNavigationSelectedState>().getSelectedIndex],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: myColor.bottomNavigationBarColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
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
              icon: Icon(
                CupertinoIcons.settings,
                color: myColor.bottomNavigationSettingItemColor,
              ),
              title: Text(
                'Настройки',
                style: TextStyle(
                  color: myColor.bottomNavigationSettingItemColor,
                ),
              ),
            ),
          ],
          itemShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.5),
          ),
          selectedItemColor: myColor.bottomNavigationSelectedItemColor,
          unselectedItemColor: myColor.bottomNavigationUnSelectedItemColor,
          currentIndex:
              context.watch<MainNavigationSelectedState>().getSelectedIndex,
          onTap: (currentIndex) {
            context
                .read<MainNavigationSelectedState>()
                .changeBottomNavigationIndex(currentIndex);
          },
        ),
      ),
    );
  }
}
