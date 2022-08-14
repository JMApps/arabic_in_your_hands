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
          child: Wrap(
            runSpacing: 8,
            children: [
              Consumer<AddWordState>(
                builder: (context, addWordState, _) {
                  return TextField(
                    controller: addWordState.getWordEditingController,
                    textCapitalization: TextCapitalization.sentences,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    autofocus: true,
                    autocorrect: false,
                    maxLength: 50,
                    cursorColor: myColor.myAccentColor,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      floatingLabelAlignment: FloatingLabelAlignment.center,
                      label: const Text(
                        'Слово',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: myColor.myAccentColor,
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
                    textAlign: TextAlign.center,
                  );
                },
              ),
              Consumer<AddWordState>(
                builder: (context, addWordState, _) {
                  return TextField(
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
                        color: myColor.myAccentColor,
                      ),
                      alignLabelWithHint: true,
                      floatingLabelAlignment: FloatingLabelAlignment.center,
                      hintText: 'Введите перевод слова',
                      errorText: addWordState
                              .getWordTranslationEditingController.text.isEmpty
                          ? 'Заполните поле'
                          : '',
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
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    textAlign: TextAlign.center,
                  );
                },
              ),
              SizedBox(
                width: double.maxFinite,
                child: Consumer<AddWordState>(
                  builder: (context, addWordState, _) {
                    return TextButton(
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
                        if (addWordState
                                .getWordEditingController.text.isNotEmpty &&
                            addWordState.getWordTranslationEditingController
                                .text.isNotEmpty) {
                          context.read<DictionaryContentState>().createWord(
                                categoryId,
                                addWordState.getWordEditingController.text,
                                addWordState
                                    .getWordTranslationEditingController.text,
                                addWordState.getWordColor.toString(),
                                categoryPriority,
                              );
                          context
                              .read<DictionaryContentState>()
                              .showSnackBarMessage(context, 'Слово добавлено');
                          Navigator.of(context).pop();
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
