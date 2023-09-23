import 'package:arabicinyourhands/core/state/provider/flip_page_state.dart';
import 'package:arabicinyourhands/core/themes/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SecondVolumeContentFlipModePage extends StatelessWidget {
  const SecondVolumeContentFlipModePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FlipPageState(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.flip_card_mode),
          actions: [
            Consumer<FlipPageState>(
              builder: (context, flipPageState, _) {
                return IconButton(
                  splashRadius: 20,
                  icon: const Icon(
                    CupertinoIcons.creditcard_fill,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    flipPageState.changeCardMode();
                  },
                );
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Card(
              margin: const EdgeInsets.only(
                left: 8,
                top: 16,
                right: 8,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(8),
              ),
            ),
            // Expanded(
            //   child: VolumeSecondFlipCardList(
            //     secondVolumeSubChapterId: secondVolumeSubChapterId,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
