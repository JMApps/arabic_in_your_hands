import 'package:arabicinyourhands/pages/dictionary.dart';
import 'package:arabicinyourhands/pages/volume_one.dart';
import 'package:arabicinyourhands/pages/volume_two.dart';
import 'package:arabicinyourhands/provider/main_bottom_navigation_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final _mainWidgets = [
    const VolumeOne(),
    const VolumeTwo(),
    const Dictionary(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5F9D78),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF5F9D78),
        actions: [
          IconButton(
            icon: const Icon(Icons.apps, color: Color(0xFF365253)),
            onPressed: () {},
          ),
        ],
      ),
      body: _mainWidgets[context.watch<MainBottomNavigationState>().getSelectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: const Color(0xFF5F9D78),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_1),
            label: 'Том 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_2),
            label: 'Том 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Словарь',
          ),
        ],
        selectedItemColor: const Color(0xFF365253),
        unselectedItemColor: const Color(0xFFF7DA8A),
        currentIndex: context.watch<MainBottomNavigationState>().getSelectedIndex,
        onTap: context.read<MainBottomNavigationState>().changeBottomNavigationIndex,
      ),
    );
  }
}
