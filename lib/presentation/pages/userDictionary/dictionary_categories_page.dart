import 'package:arabicinyourhands/presentation/pages/userDictionary/dictionary_categories_list.dart';
import 'package:arabicinyourhands/presentation/pages/userDictionary/add_category_popup.dart';
import 'package:arabicinyourhands/presentation/pages/userDictionary/search_category_delegate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DictionaryCategoriesPage extends StatelessWidget {
  const DictionaryCategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.categories),
            leading: Transform.scale(
              scale: 0.7,
              child: Image.asset('assets/icons/arabic_in_origin.png'),
            ),
            actions: [
              IconButton(
                splashRadius: 20,
                icon: const Icon(
                  CupertinoIcons.search,
                ),
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: SearchCategoryDelegate(),
                  );
                },
              ),
            ],
          ),
          body: const DictionaryCategoriesList(),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
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
                      child: const AddCategoryPopup(),
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