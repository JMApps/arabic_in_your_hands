import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/domain/arguments/collection_args.dart';
import 'package:arabicinyourhands/domain/entities/arabicDictionary/collection_entity.dart';
import 'package:arabicinyourhands/presentation/pages/arabicDictionary/widgets/collection_options.dart';
import 'package:flutter/material.dart';

class CollectionItem extends StatelessWidget {
  const CollectionItem({
    super.key,
    required this.model,
    required this.index,
  });

  final CollectionEntity model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final Color itemOddColor = appColors.primary.withOpacity(0.05);
    final Color itemEvenColor = appColors.primary.withOpacity(0.15);
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Container(
        decoration: BoxDecoration(
          color: index.isOdd ? itemOddColor : itemEvenColor,
          borderRadius: AppStyles.mainBorder,
        ),
        child: ListTile(
          onTap: () {
            Navigator.pushNamed(
              context,
              '/collection_detail_page',
              arguments: CollectionArgs(model: model),
            );
          },
          onLongPress: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (_) => CollectionOptions(collectionId: model.id),
            );
          },
          shape: AppStyles.mainShape,
          title: Text(
            model.title,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
