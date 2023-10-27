import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/data/state/collection_state.dart';
import 'package:arabicinyourhands/domain/entities/arabicDictionary/collection_entity.dart';
import 'package:arabicinyourhands/presentation/pages/arabicDictionary/items/collection_item.dart';
import 'package:arabicinyourhands/presentation/widgets/error_data_text.dart';
import 'package:arabicinyourhands/presentation/widgets/future_is_empty.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

class CollectionsList extends StatelessWidget {
  const CollectionsList({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? locale = AppLocalizations.of(context);
    return FutureBuilder<List<CollectionEntity>>(
      future: Provider.of<CollectionState>(context).fetchAllCollections(),
      builder: (BuildContext context, AsyncSnapshot<List<CollectionEntity>> snapshot) {
        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return CupertinoScrollbar(
            child: ListView.builder(
              padding: AppStyles.mainMardingMini,
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                final CollectionEntity model = snapshot.data![index];
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 250),
                  child: SlideAnimation(
                    verticalOffset: 150,
                    child: FadeInAnimation(
                      child: CollectionItem(
                        model: model,
                        index: index,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return ErrorDataText(error: snapshot.error.toString());
        } {
          return FutureIsEmpty(message: locale!.startSearch);
        }
      },
    );
  }
}
