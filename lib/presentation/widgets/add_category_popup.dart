import 'package:arabicinyourhands/domain/state/provider/add_category_state.dart';
import 'package:arabicinyourhands/domain/state/provider/dictionary_content_state.dart';
import 'package:arabicinyourhands/domain/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:o_color_picker/o_color_picker.dart';
import 'package:provider/provider.dart';

class AddCategoryPopup extends StatelessWidget {
  const AddCategoryPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AddCategoryState>(
          create: (_) => AddCategoryState(),
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
              Consumer<AddCategoryState>(
                builder: (context, addCategoryState, _) {
                  return TextFormField(
                    controller: addCategoryState.getTextEditingController,
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
                          color: Color(addCategoryState.getCategoryColor),
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
                                  addCategoryState.selectCategoryColor(color);
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
              Consumer<AddCategoryState>(
                builder: (context, addCategoryState, _) {
                  return Center(
                    child: ToggleButtons(
                      borderRadius: BorderRadius.circular(25),
                      splashColor: myColor.myAccentColor.withOpacity(0.5),
                      fillColor: myColor.myAccentColor.withOpacity(0.3),
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
                padding: const EdgeInsets.only(right: 16, top: 16, left: 16),
                child: SizedBox(
                  width: double.maxFinite,
                  child: Consumer<AddCategoryState>(
                    builder: (context, addCategoryState, _) {
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
                          if (addCategoryState.getTextEditingController.text.isNotEmpty) {
                            context.read<DictionaryContentState>().createWordCategory(
                              addCategoryState.getTextEditingController.text,
                              addCategoryState.getCategoryColor.toString(),
                              addCategoryState.getPrioritySelectedIndex,
                            );
                            context.read<DictionaryContentState>().showSnackBarMessage(context, 'Категория добавлена');
                            Navigator.of(context).pop();
                          } else {
                            Navigator.of(context).pop();
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
