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
        color: Theme.of(context).colorScheme.mainChapterCardColor,
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
                  TextFormField(
                    controller: addWordState.getWordEditingController,
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
                      labelText: 'Слово',
                      labelStyle: TextStyle(
                        color: Theme.of(context).colorScheme.myAccentColor,
                      ),
                      alignLabelWithHint: true,
                      floatingLabelAlignment: FloatingLabelAlignment.center,
                      hintText: 'Введите слово',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.myAccentColor,
                          width: 1.5,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  TextFormField(
                    controller:
                        addWordState.getWordTranslationEditingController,
                    textCapitalization: TextCapitalization.sentences,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    autocorrect: false,
                    autofocus: false,
                    maxLength: 75,
                    cursorColor: myColor.myAccentColor,
                    decoration: InputDecoration(
                      labelText: 'Перевод',
                      labelStyle: TextStyle(
                        color: Theme.of(context).colorScheme.myAccentColor,
                      ),
                      alignLabelWithHint: true,
                      floatingLabelAlignment: FloatingLabelAlignment.center,
                      hintText: 'Введите перевод слова',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.myAccentColor,
                          width: 1.5,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    textAlign: TextAlign.center,
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
                        'Добавить',
                        style: TextStyle(
                          color: myColor.myAccentColor,
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
                        } else {
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
