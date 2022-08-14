import 'package:arabicinyourhands/domain/theme/app_theme.dart';
import 'package:arabicinyourhands/presentation/lists/dictionary_categories_list.dart';
import 'package:arabicinyourhands/presentation/widgets/add_category_popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DictionaryCategoriesPage extends StatelessWidget {
  const DictionaryCategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
          body: const DictionaryCategoriesList(),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            backgroundColor: Theme.of(context).colorScheme.fabDictionaryColor,
            child: const Icon(
              CupertinoIcons.add,
              color: Colors.white,
            ),
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return SingleChildScrollView(
                    child: AnimatedPadding(
                      padding: MediaQuery.of(context).viewInsets,
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.decelerate,
                      child: AddCategoryPopup(),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
