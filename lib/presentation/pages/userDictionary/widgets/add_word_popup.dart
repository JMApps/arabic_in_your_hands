import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/core/themes/app_theme.dart';
import 'package:arabicinyourhands/data/state/user_dictionary_word_state.dart';
import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_add_word_entity.dart';
import 'package:arabicinyourhands/presentation/uiState/dictionary/word_state.dart';
import 'package:arabicinyourhands/presentation/widgets/snack_bar_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:provider/provider.dart';

import '../../../../l10n/app_localizations.dart';

class AddWordPopup extends StatefulWidget {
  const AddWordPopup({
    super.key,
    required this.categoryId,
    required this.categoryPriority,
  });

  final int categoryId;
  final int categoryPriority;

  @override
  State<AddWordPopup> createState() => _AddWordPopupState();
}

class _AddWordPopupState extends State<AddWordPopup> {
  final TextEditingController _wordEditing = TextEditingController();
  final TextEditingController _wordTranslateEditing = TextEditingController();
  final FocusNode _focusWord = FocusNode();
  final FocusNode _focusWordTranslate = FocusNode();

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? locale = AppLocalizations.of(context);
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<WordState>(
          create: (_) => WordState(),
        ),
      ],
      child: Container(
        padding: AppStyles.mainMardingWithoutTop,
        child: Consumer<WordState>(
          builder: (context, wordState, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  focusNode: _focusWord,
                  controller: _wordEditing,
                  textCapitalization: TextCapitalization.sentences,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  autofocus: true,
                  autocorrect: false,
                  maxLength: 150,
                  textAlign: TextAlign.center,
                  onChanged: (String? value) {
                    wordState.setWordState = value!;
                  },
                  decoration: InputDecoration(
                    errorText: wordState.getWordState ? locale!.enterWord : null,
                    label: Text(locale!.enterWord),
                    prefixIcon: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            alignment: Alignment.center,
                            actionsPadding: AppStyles.mainMardingMini,
                            content: Material(
                              color: Colors.transparent,
                              child: MaterialColorPicker(
                                alignment: WrapAlignment.center,
                                iconSelected: CupertinoIcons.checkmark_alt,
                                elevation: 0.5,
                                allowShades: false,
                                onMainColorChange: (ColorSwatch? color) {
                                  wordState.setWordColor = color!;
                                },
                                selectedColor: wordState.getWordColor,
                              ),
                            ),
                            actions: [
                              MaterialButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(locale.close),
                              ),
                            ],
                          ),
                        );
                      },
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.color_lens_outlined,
                        color: wordState.getWordColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  focusNode: _focusWordTranslate,
                  controller: _wordTranslateEditing,
                  textCapitalization: TextCapitalization.sentences,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  autofocus: true,
                  autocorrect: false,
                  maxLength: 150,
                  textAlign: TextAlign.center,
                  onChanged: (String? value) {
                    wordState.setWordTranslateState = value!;
                  },
                  decoration: InputDecoration(
                    errorText: wordState.getWordTranslateState
                        ? locale.enterWordTranslate
                        : null,
                    label: Text(locale.addWordTranslate),
                  ),
                ),
                const SizedBox(height: 4),
                OutlinedButton(
                  onPressed: () {
                    if (_wordEditing.text.trim().isNotEmpty && _wordTranslateEditing.text.trim().isNotEmpty) {
                      final  newWord = UserDictionaryAddWordEntity(
                        displayBy: widget.categoryId,
                        word: _wordEditing.text.trim(),
                        wordTranslate: _wordTranslateEditing.text.trim(),
                        wordItemColor: wordState.getWordColor.toHex(),
                      );
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: appColors.secondary,
                          duration: const Duration(milliseconds: 500),
                          content: SnackBarMessage(
                            message: locale.wordAdded,
                          ),
                        ),
                      );
                      Provider.of<UserDictionaryWordState>(context, listen: false).addWord(model: newWord);
                    } else if (_wordEditing.text.trim().isEmpty) {
                      wordState.setWordState = '';
                      _focusWord.requestFocus();
                    } else if (_wordTranslateEditing.text.trim().isEmpty) {
                      wordState.setWordTranslateState = '';
                      _focusWordTranslate.requestFocus();
                    }
                  },
                  child: Text(locale.add),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
