import 'dart:io';

import 'package:arabicinyourhands/pages/dictionary.dart';
import 'package:arabicinyourhands/pages/volume_one.dart';
import 'package:arabicinyourhands/pages/volume_two.dart';
import 'package:arabicinyourhands/provider/main_bottom_navigation_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final _mainWidgets = [
    VolumeOne(),
    VolumeTwo(),
    const Dictionary(),
  ];

  final _mainTitles = [
    'Том 1',
    'Том 2',
    'Словарь',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: Text(_mainTitles[context.watch<MainBottomNavigationState>().getSelectedIndex]),
        backgroundColor: const Color(0xFF243743),
        actions: [
          IconButton(
            icon: const Icon(Icons.apps, color: Color(0xFF28B78D)),
            onPressed: () async {
              await launch(
                Platform.isIOS
                    ? 'https://apps.apple.com/ru/developer/imanil-binyaminov/id1564920953'
                    : 'https://play.google.com/store/apps/dev?id=8649252597553656018',
              );
            },
          ),
        ],
        leading: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          child: Image.asset('assets/icons/arabic_in_origin.png'),
        ),
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        child: _mainWidgets[context.watch<MainBottomNavigationState>().getSelectedIndex],
        switchInCurve: Curves.easeInCubic,
        switchOutCurve: Curves.easeOutCubic,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
            color: Color(0xFF243743),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            )),
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
              icon: const Icon(Icons.add),
              title: const Text('Словарь'),
            ),
          ],
          itemShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.5)),
          selectedItemColor: const Color(0xFF37FFC2),
          unselectedItemColor: const Color(0xFF1F8D6E),
          currentIndex: context.watch<MainBottomNavigationState>().getSelectedIndex,
          onTap: context.read<MainBottomNavigationState>().changeBottomNavigationIndex,
        ),
      ),
    );
  }
}
