import 'package:arabicinyourhands/core/enums/priority.dart';
import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/core/themes/app_theme.dart';
import 'package:arabicinyourhands/data/state/user_dictionary_category_state.dart';
import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_category_entity.dart';
import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_change_category_entity.dart';
import 'package:arabicinyourhands/presentation/uiState/dictionary/category_priority_state.dart';
import 'package:arabicinyourhands/presentation/widgets/snack_bar_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:provider/provider.dart';

import '../../../../l10n/app_localizations.dart';

class ChangeCategoryPopup extends StatefulWidget {
  const ChangeCategoryPopup({
    super.key,
    required this.model,
  });

  final UserDictionaryCategoryEntity model;

  @override
  State<ChangeCategoryPopup> createState() => _ChangeCategoryPopupState();
}

class _ChangeCategoryPopupState extends State<ChangeCategoryPopup> {
  late final TextEditingController _textWordCategoryEditing;
  final FocusNode focusCategory = FocusNode();

  @override
  void initState() {
    super.initState();
    _textWordCategoryEditing = TextEditingController(text: widget.model.wordCategoryTitle.trim());
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? locale = AppLocalizations.of(context);
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CategoryProiriyState(
            widget.model.priority,
            HexColor.fromHex(widget.model.wordCategoryColor),
          ),
        ),
      ],
      child: Container(
        padding: AppStyles.mainMardingWithoutTop,
        child: Consumer<CategoryProiriyState>(
          builder: (BuildContext context, categoryState, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _textWordCategoryEditing,
                  textCapitalization: TextCapitalization.sentences,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  autofocus: true,
                  autocorrect: false,
                  maxLength: 150,
                  textAlign: TextAlign.center,
                  onChanged: (String? value) {
                    categoryState.setCategoryState = value!;
                  },
                  decoration: InputDecoration(
                    label: Text(locale!.enterNameCategory),
                    errorText: categoryState.getCategoryState
                        ? locale.enterNameCategory
                        : null,
                    suffixIcon: IconButton(
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
                                iconSelected: CupertinoIcons.check_mark_circled,
                                elevation: 0.5,
                                allowShades: false,
                                onMainColorChange: (ColorSwatch? color) {
                                  categoryState.setCategoryColor = color!;
                                },
                                selectedColor: categoryState.getCategoryColor,
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
                        color: categoryState.getCategoryColor,
                      ),
                    ),
                  ),
                ),
                Text(
                  locale.priority,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Center(
                  child: ToggleButtons(
                    borderRadius: AppStyles.mainBorder,
                    isSelected: [
                      categoryState.categoryPriority == Priorities.without,
                      categoryState.categoryPriority == Priorities.low,
                      categoryState.categoryPriority == Priorities.medium,
                      categoryState.categoryPriority == Priorities.high,
                    ],
                    children: const <CircleAvatar>[
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.grey,
                      ),
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.amber,
                      ),
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.green,
                      ),
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.red,
                      ),
                    ],
                    onPressed: (int priorityIndex) {
                      categoryState.setPriorityIndex = priorityIndex;
                    },
                  ),
                ),
                const SizedBox(height: 16),
                OutlinedButton(
                  onPressed: () async {
                    if (_textWordCategoryEditing.text.trim().isNotEmpty) {
                      final newModel = UserDictionaryChangeCategoryEntity(
                        id: widget.model.id,
                        wordCategoryTitle: _textWordCategoryEditing.text.trim(),
                        wordCategoryColor: categoryState.getCategoryColor.toHex(),
                        priority: categoryState.getPriorityIndex,
                      );
                      if (!widget.model.equals(newModel)) {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: appColors.secondary,
                            duration: const Duration(milliseconds: 500),
                            content: SnackBarMessage(
                              message: locale.categoryChanged,
                            ),
                          ),
                        );
                        Provider.of<UserDictionaryCategoryState>(context, listen: false).changeCategory(model: newModel);
                      } else {
                        Navigator.pop(context);
                      }
                    } else {
                      categoryState.setCategoryState = '';
                      focusCategory.requestFocus();
                    }
                  },
                  child: Text(locale.change),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
