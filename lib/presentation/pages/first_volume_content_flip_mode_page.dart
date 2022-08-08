import 'package:arabicinyourhands/domain/state/provider/flip_page_state.dart';
import 'package:arabicinyourhands/presentation/lists/volume_first_flip_card_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstVolumeContentFlipModePage extends StatelessWidget {
  const FirstVolumeContentFlipModePage({
    Key? key,
    required this.firstVolumeSubChapterId,
    required this.dialogTitle,
  }) : super(key: key);

  final int firstVolumeSubChapterId;
  final String dialogTitle;

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
          centerTitle: true,
          backgroundColor: const Color(0xFF243743),
          title: const Text('Режим карточек'),
        ),
        body: Column(
          children: [
            Card(
              color: const Color(0xFF006D50),
              margin: const EdgeInsets.all(8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
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
              child: VolumeFirstFlipCardList(
                firstVolumeSubChapterId: firstVolumeSubChapterId,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
