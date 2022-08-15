import 'package:arabicinyourhands/presentation/lists/dictionary_categories_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DictionaryContentPage extends StatelessWidget {
  const DictionaryContentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Категории'),
        leading: Transform.scale(
          scale: 0.7,
          child: Image.asset('assets/icons/arabic_in_origin.png'),
        ),
      ),
      body: const CupertinoScrollbar(
        child: DictionaryCategoriesList(),
      ),
    );
  }
}
