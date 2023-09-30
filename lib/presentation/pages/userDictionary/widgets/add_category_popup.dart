import 'package:arabicinyourhands/core/enums/priority.dart';
import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/core/themes/app_theme.dart';
import 'package:arabicinyourhands/data/repositories/userDictionary/user_dictionary_category_data_repository.dart';
import 'package:arabicinyourhands/domain/entities/userDictionary/user_dictionary_add_category_entity.dart';
import 'package:arabicinyourhands/domain/usecases/usetDictionary/user_dictionary_categories_use_case.dart';
import 'package:arabicinyourhands/presentation/uiState/dictionary/category_priority_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:provider/provider.dart';

class AddCategoryPopup extends StatefulWidget {
  const AddCategoryPopup({Key? key}) : super(key: key);

  @override
  State<AddCategoryPopup> createState() => _AddCategoryPopupState();
}

class _AddCategoryPopupState extends State<AddCategoryPopup> {
  late final UserDictionaryCategoriesUseCase _categoriesUseCase;
  late final UserDictionaryAddCategoryEntity model;
  final TextEditingController _textWordCategoryEditing = TextEditingController();

  @override
  void initState() {
    super.initState();
    _categoriesUseCase = UserDictionaryCategoriesUseCase(UserDictionaryCategoryDataRepository());
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? locale = AppLocalizations.of(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CategoryProiriyState(),
        ),
      ],
      child: Container(
        padding: AppStyles.mainMarding,
        child: Consumer<CategoryProiriyState>(
          builder: (BuildContext context, priorityState, _) {
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
                  decoration: InputDecoration(
                    label: Text(locale!.enter_category_name),
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
                                elevation: 0.5,
                                onlyShadeSelection: true,
                                onColorChange: (Color color) {
                                  priorityState.setCategoryColor = color;
                                },
                                selectedColor: priorityState.getCategoryColor,
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
                        color: priorityState.getCategoryColor,
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
                      priorityState.categoryPriority == Priorities.without,
                      priorityState.categoryPriority == Priorities.low,
                      priorityState.categoryPriority == Priorities.medium,
                      priorityState.categoryPriority == Priorities.high,
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
                      priorityState.setPriorityIndex = priorityIndex;
                    },
                  ),
                ),
                const SizedBox(height: 16),
                OutlinedButton(
                  onPressed: () async {
                    if (_textWordCategoryEditing.text.isNotEmpty) {
                      model = UserDictionaryAddCategoryEntity(
                        wordCategoryTitle: _textWordCategoryEditing.text,
                        wordCategoryColor: priorityState.getCategoryColor.toHex(),
                        priority: priorityState.getPriorityIndex,
                        addDateTime: DateTime.now().toString(),
                        changeDateTime: DateTime.now().toString(),
                      );
                      Navigator.pop(context);
                      await _categoriesUseCase.addCategory(model: model);
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
