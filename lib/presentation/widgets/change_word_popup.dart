import 'package:arabicinyourhands/data/database/model/dictionary_word_model.dart';
import 'package:arabicinyourhands/domain/state/provider/change_word_state.dart';
import 'package:arabicinyourhands/domain/state/provider/dictionary_content_state.dart';
import 'package:arabicinyourhands/domain/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:o_color_picker/o_color_picker.dart';
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
            int.parse(item.wordItemColor),
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
                  TextFormField(
                    controller: changeWordState.getWordEditingController,
                    textCapitalization: TextCapitalization.sentences,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    autocorrect: false,
                    autofocus: true,
                    maxLength: 50,
                    cursorColor: myColor.myAccentColor,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        splashRadius: 15,
                        icon: Icon(
                          Icons.palette,
                          color: Color(changeWordState.getWordColor),
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
                              content: OColorPicker(
                                selectedColor:
                                    Color(changeWordState.getWordColor),
                                colors: primaryColorsPalette,
                                onColorChange: (color) {
                                  changeWordState.selectWordColor(color);
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          );
                        },
                      ),
                      labelText: 'Слово',
                      labelStyle: const TextStyle(
                        color: Colors.grey,
                      ),
                      errorText: changeWordState.getWordEditingController.text.isEmpty ? 'Заполните поле' : '',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: myColor.myAccentColor,
                          width: 1.5,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 1.5,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: myColor.myAccentColor,
                          width: 1.5,
                        ),
                      ),
                      alignLabelWithHint: true,
                      floatingLabelAlignment: FloatingLabelAlignment.center,
                      hintText: 'Введите слово',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      changeWordState.onChangeWordText(value);
                    },
                  ),
                  TextFormField(
                    controller: changeWordState.getWordTranslationEditingController,
                    textCapitalization: TextCapitalization.sentences,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    autocorrect: false,
                    autofocus: false,
                    maxLength: 75,
                    cursorColor: myColor.myAccentColor,
                    decoration: InputDecoration(
                      labelText: 'Перевод',
                      labelStyle: const TextStyle(
                        color: Colors.grey,
                      ),
                      errorText: changeWordState.getWordTranslationEditingController.text.isEmpty ? 'Запоните поле' : '',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: myColor.myAccentColor,
                          width: 1.5,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 1.5,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: myColor.myAccentColor,
                          width: 1.5,
                        ),
                      ),
                      alignLabelWithHint: true,
                      floatingLabelAlignment: FloatingLabelAlignment.center,
                      hintText: 'Введите перевод слова',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      changeWordState.onChangeWordTranslationText(value);
                    },
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          side: BorderSide(color: myColor.myAccentColor),
                        ),
                        primary: myColor.myAccentColor,
                      ),
                      child: Text(
                        'Изменить',
                        style: TextStyle(
                          color: myColor.myAccentColor,
                        ),
                      ),
                      onPressed: () {
                        if (changeWordState.getWordEditingController.text.isNotEmpty &&
                            changeWordState.getWordTranslationEditingController.text.isNotEmpty) {
                          if (changeWordState.getWordEditingController.text !=
                                  item.word ||
                              changeWordState.getWordTranslationEditingController.text !=
                                  item.wordTranslate ||
                              changeWordState.getWordColor.toString() !=
                                  item.wordItemColor.toString()) {
                            context.read<DictionaryContentState>().updateWord(
                                  item.id,
                                  changeWordState.getWord,
                                  changeWordState.getWordTranslation,
                                  changeWordState.getWordColor.toString(),
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
