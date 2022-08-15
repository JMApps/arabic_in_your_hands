import 'package:arabicinyourhands/data/database/model/dictionary_word_model.dart';
import 'package:arabicinyourhands/domain/state/provider/change_word_state.dart';
import 'package:arabicinyourhands/domain/state/provider/dictionary_content_state.dart';
import 'package:arabicinyourhands/domain/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

class ChangeWordPopup extends StatelessWidget {
  const ChangeWordPopup({Key? key, required this.item}) : super(key: key);

  final DictionaryWordModel item;

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ChangeWordState>(
          create: (_) => ChangeWordState(
            item.word,
            item.wordTranslate,
            HexColor.fromHex(item.wordItemColor),
          ),
        ),
      ],
      child: Card(
        color: myColor.mainChapterCardColor,
        elevation: 0,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Consumer<ChangeWordState>(
            builder: (context, changeWordState, _) {
              return Wrap(
                runSpacing: 8,
                children: [
                  TextField(
                    controller: changeWordState.getWordEditingController,
                    textCapitalization: TextCapitalization.sentences,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    autofocus: true,
                    autocorrect: false,
                    maxLength: 50,
                    cursorColor: myColor.myAccentColor,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      changeWordState.onChangeWordText(value);
                    },
                    decoration: InputDecoration(
                      labelText: 'Слово',
                      errorText: changeWordState.getWord.isEmpty ? 'Введите слово' : '',
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                          color: changeWordState.getWord.isEmpty
                              ? myColor.priorityMediumColor
                              : myColor.myAccentColor,
                          width: 1.5,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: changeWordState.getWord.isEmpty
                              ? myColor.priorityMediumColor
                              : myColor.myAccentColor,
                          width: 1.5,
                        ),
                      ),
                      suffixIcon: IconButton(
                        splashRadius: 15,
                        icon: Icon(
                          Icons.palette,
                          color: changeWordState.getWordColor,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              backgroundColor: myColor.mainChapterCardColor,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              content: BlockPicker(
                                pickerColor: Colors.grey,
                                onColorChanged: (color) {
                                  changeWordState.selectWordColor(color);
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  TextField(
                    controller: changeWordState.getWordTranslationEditingController,
                    textCapitalization: TextCapitalization.sentences,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    autofocus: false,
                    autocorrect: false,
                    maxLength: 75,
                    cursorColor: myColor.myAccentColor,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      changeWordState.onChangeWordTranslationText(value);
                    },
                    decoration: InputDecoration(
                      labelText: 'Перевод',
                      errorText: changeWordState.getWordTranslation.isEmpty ? 'Введите перевод слова' : '',
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                          color: changeWordState.getWordTranslation.isEmpty
                              ? myColor.priorityMediumColor
                              : myColor.myAccentColor,
                          width: 1.5,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: changeWordState.getWordTranslation.isEmpty
                              ? myColor.priorityMediumColor
                              : myColor.myAccentColor,
                          width: 1.5,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          side: BorderSide(color: myColor.myPrimaryColor),
                        ),
                        primary: myColor.myAccentColor,
                      ),
                      child: Text(
                        'Изменить',
                        style: TextStyle(
                          color: myColor.myPrimaryColor,
                        ),
                      ),
                      onPressed: () {
                        if (changeWordState.getWordEditingController.text.isNotEmpty &&
                            changeWordState.getWordTranslationEditingController.text.isNotEmpty) {
                          if (changeWordState.getWordEditingController.text != item.word ||
                              changeWordState.getWordTranslationEditingController.text != item.wordTranslate ||
                              changeWordState.getWordColor.toString() != item.wordItemColor.toString()) {
                            context.read<DictionaryContentState>().updateWord(
                                  item.id,
                                  changeWordState.getWord,
                                  changeWordState.getWordTranslation,
                                  changeWordState.getWordColor.toHex(),
                                );
                            context.read<DictionaryContentState>().showSnackBarMessage(context, 'Изменено');
                            Navigator.of(context).pop();
                          } else {
                            Navigator.of(context).pop();
                          }
                        }
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
