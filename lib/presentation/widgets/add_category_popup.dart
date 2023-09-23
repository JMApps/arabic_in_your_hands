import 'package:arabicinyourhands/core/state/provider/add_category_state.dart';
import 'package:arabicinyourhands/core/state/provider/dictionary_content_state.dart';
import 'package:arabicinyourhands/core/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddCategoryPopup extends StatelessWidget {
  const AddCategoryPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AddCategoryState>(
          create: (_) => AddCategoryState(),
        ),
      ],
      child: Card(
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
              Consumer<AddCategoryState>(
                builder: (context, addCategoryState, _) {
                  return TextField(
                    controller: addCategoryState.getTextEditingController,
                    textCapitalization: TextCapitalization.sentences,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    autofocus: true,
                    autocorrect: false,
                    maxLength: 150,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      addCategoryState.onCategoryTextChanged(value);
                    },
                    decoration: InputDecoration(
                      labelText: appLocalizations.category_name,
                      errorText: addCategoryState.getCategoryTitle.isEmpty ? appLocalizations.enter_category_name : '',
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                          width: 1.5,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          width: 1.5,
                        ),
                      ),
                      suffixIcon: IconButton(
                        splashRadius: 15,
                        icon: Icon(
                          Icons.palette,
                          color: addCategoryState.getCategoryColor,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              content: BlockPicker(
                                pickerColor: Colors.grey,
                                onColorChanged: (color) {
                                  addCategoryState.selectCategoryColor(color);
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
              SizedBox(
                width: double.maxFinite,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    appLocalizations.priority,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Consumer<AddCategoryState>(
                builder: (context, addCategoryState, _) {
                  return Center(
                    child: ToggleButtons(
                      borderRadius: BorderRadius.circular(25),
                      isSelected: addCategoryState.getIsPrioritySelected,
                      children: [
                        CircleAvatar(
                          radius: 12.5,
                        ),
                        CircleAvatar(
                          radius: 12.5,
                        ),
                        CircleAvatar(
                          radius: 12.5,
                        ),
                        CircleAvatar(
                          maxRadius: 12.5,
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
                  child: Consumer<AddCategoryState>(
                    builder: (context, addCategoryState, _) {
                      return TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: Text(
                          appLocalizations.add,
                          style: TextStyle(
                          ),
                        ),
                        onPressed: () {
                          if (addCategoryState.getTextEditingController.text.isNotEmpty) {
                            context.read<DictionaryContentState>().createWordCategory(
                                  addCategoryState.getTextEditingController.text,
                                  addCategoryState.getCategoryColor.toHex(),
                                  addCategoryState.getPrioritySelectedIndex,
                                );
                            context.read<DictionaryContentState>().showSnackBarMessage(context, appLocalizations.dictionary_category_category_added);
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