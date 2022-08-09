import 'package:arabicinyourhands/domain/state/provider/flip_page_state.dart';
import 'package:arabicinyourhands/presentation/lists/volume_second_flip_card_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SecondVolumeContentFlipModePage extends StatelessWidget {
  const SecondVolumeContentFlipModePage({
    Key? key,
    required this.secondVolumeSubChapterId,
    required this.dialogTitle,
  }) : super(key: key);

  final int secondVolumeSubChapterId;
  final String dialogTitle;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FlipPageState(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: const Color(0xFF243743),
              title: const Text('Режим карточек'),
              actions: [
                IconButton(
                  splashRadius: 20,
                  icon: const Icon(
                    CupertinoIcons.creditcard_fill,
                  ),
                  onPressed: () {
                    context.read<FlipPageState>().changeCardMode();
                  },
                ),
              ],
            ),
            body: Column(
              children: [
                Card(
                  color: const Color(0xFF006D50),
                  margin: const EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      dialogTitle,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontFamily: 'Gilroy medium',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  child: VolumeSecondFlipCardList(
                    secondVolumeSubChapterId: secondVolumeSubChapterId,
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
