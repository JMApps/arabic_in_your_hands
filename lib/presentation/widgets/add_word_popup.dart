import 'package:arabicinyourhands/domain/state/provider/add_word_state.dart';
import 'package:arabicinyourhands/domain/state/provider/dictionary_content_state.dart';
import 'package:arabicinyourhands/domain/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:o_color_picker/o_color_picker.dart';
import 'package:provider/provider.dart';

class AddWordPopup extends StatelessWidget {
  const AddWordPopup({
    Key? key,
    required this.categoryId,
    required this.categoryPriority,
  }) : super(key: key);

  final int categoryId;
  final int categoryPriority;

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AddWordState>(
          create: (_) => AddWordState(),
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
          child: Consumer<AddWordState>(
            builder: (context, addWordState, _) {
              return Wrap(
                runSpacing: 8,
                children: [
                  TextField(
                    controller: addWordState.getWordEditingController,
                    textCapitalization: TextCapitalization.sentences,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    autofocus: true,
                    autocorrect: false,
                    maxLength: 50,
                    cursorColor: myColor.myAccentColor,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      addWordState.onWordTextChanged(value);
                    },
                    decoration: InputDecoration(
                      labelText: 'Слово',
                      errorText: addWordState.getWord.isEmpty ? 'Введите слово' : '',
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: addWordState.getWord.isEmpty
                              ? myColor.priorityMediumColor
                              : myColor.myAccentColor,
                          width: 1.5,
                        ),
                      ),
                      suffixIcon: IconButton(
                        splashRadius: 15,
                        icon: Icon(
                          Icons.palette,
                          color: Color(addWordState.getWordColor),
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
                                selectedColor: Colors.grey[700],
                                colors: primaryColorsPalette,
                                onColorChange: (color) {
                                  addWordState.selectWordColor(color);
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
                    controller: addWordState.getWordTranslationEditingController,
                    textCapitalization: TextCapitalization.sentences,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    autofocus: false,
                    autocorrect: false,
                    maxLength: 75,
                    cursorColor: myColor.myAccentColor,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      addWordState.onWordTranslationTextChanged(value);
                    },
                    decoration: InputDecoration(
                      labelText: 'Перевод',
                      errorText: addWordState.getWordTranslation.isEmpty ? 'Введите перевод слова' : '',
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: addWordState.getWordTranslation.isEmpty
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
                        primary: myColor.myPrimaryColor,
                      ),
                      child: Text(
                        'Добавить',
                        style: TextStyle(
                          color: myColor.myPrimaryColor,
                        ),
                      ),
                      onPressed: () {
                        if (addWordState.getWordEditingController.text.isNotEmpty &&
                            addWordState.getWordTranslationEditingController.text.isNotEmpty) {
                          context.read<DictionaryContentState>().createWord(
                                categoryId,
                                addWordState.getWordEditingController.text,
                                addWordState.getWordTranslationEditingController.text,
                                addWordState.getWordColor.toString(),
                                categoryPriority,
                              );
                          context.read<DictionaryContentState>().showSnackBarMessage(context, 'Слово добавлено');
                          Navigator.of(context).pop();
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
