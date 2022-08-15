import 'package:arabicinyourhands/data/database/model/dictionary_category_model.dart';
import 'package:arabicinyourhands/domain/state/provider/change_category_state.dart';
import 'package:arabicinyourhands/domain/state/provider/dictionary_content_state.dart';
import 'package:arabicinyourhands/domain/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
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
            HexColor.fromHex(item.wordCategoryColor),
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
            runSpacing: 4,
            children: [
              Consumer<ChangeCategoryState>(
                builder: (context, changeCategoryState, _) {
                  return TextField(
                    controller: changeCategoryState.getTextEditingController,
                    textCapitalization: TextCapitalization.sentences,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    autofocus: true,
                    autocorrect: false,
                    maxLength: 150,
                    cursorColor: myColor.myAccentColor,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      changeCategoryState.onCategoryTextChanged(value);
                    },
                    decoration: InputDecoration(
                      labelText: 'Название категории',
                      errorText: changeCategoryState.getCategoryTitle.isEmpty ? 'Введите название категории' : '',
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                          color: changeCategoryState.getCategoryTitle.isEmpty
                              ? myColor.priorityMediumColor
                              : myColor.myAccentColor,
                          width: 1.5,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: changeCategoryState.getCategoryTitle.isEmpty ? myColor.priorityMediumColor : myColor.myAccentColor,
                          width: 1.5,
                        ),
                      ),
                      suffixIcon: IconButton(
                        splashRadius: 15,
                        icon: Icon(
                          Icons.palette,
                          color: changeCategoryState.getCategoryColor,
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
                                  changeCategoryState.selectCategoryColor(color);
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
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
                builder: (context, addCategoryState, _) {
                  return Center(
                    child: ToggleButtons(
                      borderRadius: BorderRadius.circular(25),
                      splashColor: myColor.myAccentColor.withOpacity(0.1),
                      fillColor: myColor.myAccentColor.withOpacity(0.2),
                      isSelected: addCategoryState.getIsPrioritySelected,
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
                        addCategoryState.selectTogglePriority(index);
                      },
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 16,
                  top: 16,
                  left: 16,
                ),
                child: SizedBox(
                  width: double.maxFinite,
                  child: Consumer<ChangeCategoryState>(
                    builder: (context, changeCategoryState, _) {
                      return TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: BorderSide(color: myColor.myPrimaryColor),
                          ),
                          primary: myColor.myPrimaryColor,
                        ),
                        child: Text(
                          'Изменить',
                          style: TextStyle(
                            color: myColor.myPrimaryColor,
                          ),
                        ),
                        onPressed: () {
                          if (changeCategoryState.getTextEditingController.text.isNotEmpty) {
                            if (changeCategoryState.getTextEditingController.text != item.wordCategoryTitle ||
                                changeCategoryState.getCategoryColor.toString() != item.wordCategoryColor ||
                                changeCategoryState.getPrioritySelectedIndex != item.priority) {
                              context.read<DictionaryContentState>().updateWordCategory(
                                item.id,
                                changeCategoryState.getCategoryTitle,
                                changeCategoryState.getCategoryColor.toHex(),
                                changeCategoryState.getPrioritySelectedIndex,);
                              context.read<DictionaryContentState>().showSnackBarMessage(context, 'Категория изменена');
                              Navigator.of(context).pop();
                            } else {
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
