import 'package:arabicinyourhands/domain/state/provider/add_word_state.dart';
import 'package:arabicinyourhands/domain/state/provider/dictionary_content_state.dart';
import 'package:arabicinyourhands/domain/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    final appLocalizations = AppLocalizations.of(context)!;
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
                      labelText: appLocalizations.word,
                      errorText: addWordState.getWord.isEmpty ? appLocalizations.enter_word : '',
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                          color: addWordState.getWord.isEmpty
                              ? myColor.priorityMediumColor
                              : myColor.myAccentColor,
                          width: 1.5,
                        ),
                      ),
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
                          color: addWordState.getWordColor,
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
                      labelText: appLocalizations.translation,
                      errorText: addWordState.getWordTranslation.isEmpty ? appLocalizations.enter_translation : '',
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                          color: addWordState.getWordTranslation.isEmpty
                              ? myColor.priorityMediumColor
                              : myColor.myAccentColor,
                          width: 1.5,
                        ),
                      ),
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
                        foregroundColor: myColor.myPrimaryColor,
                      ),
                      child: Text(
                        appLocalizations.add,
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
                                addWordState.getWordColor.toHex(),
                                categoryPriority,
                              );
                          context.read<DictionaryContentState>().showSnackBarMessage(context, appLocalizations.dictionary_word_category_added);
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
