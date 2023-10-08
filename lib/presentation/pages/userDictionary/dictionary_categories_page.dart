import 'package:arabicinyourhands/presentation/pages/userDictionary/lists/dictionary_categories_list.dart';
import 'package:arabicinyourhands/presentation/pages/userDictionary/widgets/add_category_popup.dart';
import 'package:arabicinyourhands/presentation/pages/userDictionary/widgets/search_category_delegate.dart';
import 'package:arabicinyourhands/presentation/widgets/main_app_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DictionaryCategoriesPage extends StatelessWidget {
  const DictionaryCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? locale = AppLocalizations.of(context);
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(locale!.categories),
        leading: const MainAppIcon(),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchCategoryDelegate(
                  hintText: locale.search_categories,
                ),
              );
            },
          ),
        ],
      ),
      body: const DictionaryCategoriesList(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: appColors.secondary,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return AnimatedPadding(
                padding: MediaQuery.of(context).viewInsets,
                duration: const Duration(milliseconds: 250),
                curve: Curves.decelerate,
                child: const AddCategoryPopup(),
              );
            },
          );
        },
        child: const Icon(CupertinoIcons.add),
      ),
    );
  }
}
