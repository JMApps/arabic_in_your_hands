import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/presentation/uiState/main_navigation_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    final MainNavigationState navigationState = Provider.of<MainNavigationState>(context);
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        switchInCurve: Curves.easeInCubic,
        switchOutCurve: Curves.easeInCubic,
        child: AppStyles.mainPages[navigationState.getCurrentIndex],
      ),
      bottomNavigationBar: SalomonBottomBar(
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.filter_1_outlined),
            title: Text(locale.volume_1),
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.filter_2_outlined),
            title: Text(locale.volume_2),
          ),
          SalomonBottomBarItem(
            icon: const Icon(CupertinoIcons.add),
            title: Text(locale.dictionary),
          ),
          SalomonBottomBarItem(
            icon: const Icon(CupertinoIcons.settings),
            title: Text(locale.settings),
          ),
        ],
        duration: const Duration(milliseconds: 250),
        itemShape: AppStyles.mainShapeMini,
        currentIndex: navigationState.getCurrentIndex,
        onTap: (int index) {
          navigationState.changeCurrentIndex(index);
        },
      ),
    );
  }
}
