import 'package:arabicinyourhands/data/database/model/dictionary_category_model.dart';
import 'package:arabicinyourhands/domain/state/provider/change_category_state.dart';
import 'package:arabicinyourhands/domain/state/provider/dictionary_content_state.dart';
import 'package:arabicinyourhands/domain/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:o_color_picker/o_color_picker.dart';
import 'package:provider/provider.dart';

class ChangeCategoryPopup extends StatelessWidget {
  const ChangeCategoryPopup({
    Key? key,
    required this.item,
  }) : super(key: key);

  final DictionaryCategoryModel item;

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ChangeCategoryState>(
          create: (_) => ChangeCategoryState(
            item.wordCategoryTitle,
            int.parse(item.wordCategoryColor),
            item.priority,
          ),
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
          child: Wrap(
            children: [
              Consumer<ChangeCategoryState>(
                builder: (context, changeCategoryState, _) {
                  return TextFormField(
                    controller: changeCategoryState.getTextEditingController,
                    textCapitalization: TextCapitalization.sentences,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    autocorrect: false,
                    autofocus: true,
                    maxLength: 150,
                    cursorColor: myColor.myAccentColor,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        splashRadius: 15,
                        icon: Icon(
                          Icons.palette,
                          color: Color(changeCategoryState.getCategoryColor),
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
                                selectedColor: Color(changeCategoryState.getCategoryColor),
                                colors: primaryColorsPalette,
                                onColorChange: (color) {
                                  changeCategoryState.selectCategoryColor(color);
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          );
                        },
                      ),
                      labelText: 'Название категории',
                      labelStyle: TextStyle(
                        color: Theme.of(context).colorScheme.myAccentColor,
                      ),
                      alignLabelWithHint: true,
                      floatingLabelAlignment: FloatingLabelAlignment.center,
                      hintText: 'Введите название категории',
                      errorText: changeCategoryState.getTextEditingController.text.isEmpty ? 'Это поле не должно быть пустым' : '',
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
                    onChanged: (value) {
                      changeCategoryState.onChangeCurrentText(value);
                    },
                  );
                },
              ),
              const SizedBox(
                width: double.maxFinite,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Приоритет',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Consumer<ChangeCategoryState>(
                builder: (context, changeCategoryState, _) {
                  return Center(
                    child: ToggleButtons(
                      borderRadius: BorderRadius.circular(25),
                      splashColor: myColor.myAccentColor.withOpacity(0.5),
                      fillColor: myColor.myAccentColor.withOpacity(0.3),
                      isSelected: changeCategoryState.getIsPrioritySelected,
                      children: [
                        CircleAvatar(
                          radius: 12.5,
                          backgroundColor: myColor.priorityWithoutColor,
                        ),
                        CircleAvatar(
                          radius: 12.5,
                          backgroundColor: myColor.priorityLowColor,
                        ),
                        CircleAvatar(
                          radius: 12.5,
                          backgroundColor: myColor.priorityHighColor,
                        ),
                        CircleAvatar(
                          maxRadius: 12.5,
                          backgroundColor: myColor.priorityMediumColor,
                        ),
                      ],
                      onPressed: (index) {
                        changeCategoryState.selectTogglePriority(index);
                      },
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16, top: 16, left: 16),
                child: SizedBox(
                  width: double.maxFinite,
                  child: Consumer<ChangeCategoryState>(
                    builder: (context, changeCategoryState, _) {
                      return TextButton(
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
                          if (changeCategoryState.getTextEditingController.text.isNotEmpty) {
                            if (changeCategoryState.getTextEditingController.text != item.wordCategoryTitle ||
                                changeCategoryState.getCategoryColor.toString() != item.wordCategoryColor ||
                                changeCategoryState.getPrioritySelectedIndex != item.priority) {
                              context.read<DictionaryContentState>().updateWordCategory(
                                item.id,
                                changeCategoryState.getWordCategoryTitle,
                                changeCategoryState.getCategoryColor.toString(),
                                changeCategoryState.getPrioritySelectedIndex,);
                              context.read<DictionaryContentState>().showSnackBarMessage(context, 'Категория изменена');
                              Navigator.of(context).pop();
                            }
                          }
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
