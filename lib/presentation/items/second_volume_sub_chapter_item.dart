import 'package:arabicinyourhands/data/database/model/volume_second_item_sub_chapter_model.dart';
import 'package:arabicinyourhands/domain/state/provider/main_navigation_selected_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SecondVolumeSubChapterItem extends StatelessWidget {
  const SecondVolumeSubChapterItem({Key? key, required this.item})
      : super(key: key);

  final VolumeSecondItemSubChapterModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: context.watch<MainNavigationSelectedState>().getCurrentSecondSelectedItem == item.id
          ? const Color(0xFF243743)
          : item.id.isOdd ? const Color(0xFF28B78D) : const Color(0xFF209372),
      margin: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 16,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              Wrap(
                children: [
                  Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      color: Colors.white,
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFD5FFEF),
                          Color(0xFFFFFFFF),
                        ],
                      ),
                    ),
                    child: Text(
                      item.dialog,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF243743),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Center(
                  child: Text(
                    item.dialogTitle,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          context.read<MainNavigationSelectedState>().updateSecondSelectedState(item.id);
        },
      ),
    );
  }
}
