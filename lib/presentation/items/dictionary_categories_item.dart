import 'package:arabicinyourhands/data/database/model/dictionary_category_model.dart';
import 'package:arabicinyourhands/domain/state/provider/dictionary_content_state.dart';
import 'package:arabicinyourhands/domain/theme/app_theme.dart';
import 'package:arabicinyourhands/presentation/widgets/change_category_popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DictionaryCategoriesItem extends StatelessWidget {
  const DictionaryCategoriesItem({Key? key, required this.item})
      : super(key: key);

  final DictionaryCategoryModel item;

  @override
  Widget build(BuildContext context) {
    final myColor = Theme.of(context).colorScheme;
    final getWatchDictionaryContentState =
        context.watch<DictionaryContentState>();
    final getReadDictionaryContentState =
        context.read<DictionaryContentState>();
    return Card(
      color: Theme.of(context).colorScheme.mainChapterCardColor,
      margin:
          EdgeInsets.symmetric(horizontal: 8, vertical: item.id!.isOdd ? 8 : 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                flex: 15,
                child: Text('${item.wordCategoryTitle}'),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Color(int.parse(item.wordCategoryColor!)),
                    shape: BoxShape.circle,
                  ),
                ),
              )
            ],
          ),
        ),
        onTap: () {
          // Переход на страницу слов
        },
        onLongPress: () {
          showCupertinoModalPopup(
            context: context,
            builder: (context) {
              return Card(
                color: myColor.mainChapterCardColor,
                margin: const EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Wrap(
                  runAlignment: WrapAlignment.center,
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Divider(
                      indent: 24,
                      endIndent: 24,
                      color: myColor.myPrimaryColor,
                    ),
                    ListTile(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16),
                      title: const Text('Изменить'),
                      trailing: Icon(
                        CupertinoIcons.pencil_circle,
                        color: myColor.myAccentColor,
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return SingleChildScrollView(
                              child: AnimatedPadding(
                                padding: MediaQuery.of(context).viewInsets,
                                duration: const Duration(milliseconds: 100),
                                curve: Curves.decelerate,
                                child: const ChangeCategoryPopup(),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    Divider(
                      indent: 16,
                      endIndent: 16,
                      color: myColor.myPrimaryColor,
                    ),
                    ListTile(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16),
                      title: const Text('Удалить'),
                      trailing: Icon(
                        CupertinoIcons.delete,
                        color: myColor.myAccentColor,
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) {
                            return CupertinoAlertDialog(
                              title: const Text('Удаление'),
                              content: const Text(
                                  'Вы уверены, что хотите удалить данную категорию вместе с её содержимым?'),
                              actions: [
                                CupertinoDialogAction(
                                  child: Text(
                                    'Нет',
                                    style: TextStyle(
                                      color: myColor.myAccentColor,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                CupertinoDialogAction(
                                  child: Text(
                                    'Да',
                                    style: TextStyle(
                                      color: myColor.myAccentColor,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                    Divider(
                      indent: 24,
                      endIndent: 24,
                      color: myColor.myPrimaryColor,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
