import 'package:arabicinyourhands/core/styles/app_styles.dart';
import 'package:arabicinyourhands/data/state/collection_state.dart';
import 'package:arabicinyourhands/domain/entities/arabicDictionary/collection_add_entity.dart';
import 'package:arabicinyourhands/domain/entities/arabicDictionary/collection_change_entity.dart';
import 'package:arabicinyourhands/domain/entities/arabicDictionary/collection_entity.dart';
import 'package:arabicinyourhands/presentation/uiState/dictionary/input_collection_state.dart';
import 'package:arabicinyourhands/presentation/widgets/snack_bar_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class ChangeCollectionPopup extends StatefulWidget {
  const ChangeCollectionPopup({
    super.key,
    required this.model,
  });

  final CollectionEntity model;

  @override
  State<ChangeCollectionPopup> createState() => _ChangeCollectionPopupState();
}

class _ChangeCollectionPopupState extends State<ChangeCollectionPopup> {
  late final TextEditingController _textEditingCollection;
  final FocusNode _focusCollection = FocusNode();

  @override
  void initState() {
    _textEditingCollection = TextEditingController(text: widget.model.title);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? locale = AppLocalizations.of(context);
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<InputCollectionState>(
          create: (_) => InputCollectionState(),
        ),
      ],
      child: Consumer<InputCollectionState>(
        builder: (BuildContext context, collectionState, _) {
          return Container(
            padding: AppStyles.mainMarding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _textEditingCollection,
                  textCapitalization: TextCapitalization.sentences,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  autofocus: true,
                  autocorrect: false,
                  maxLength: 150,
                  textAlign: TextAlign.center,
                  onChanged: (String? value) {
                    collectionState.setCollectionState = value!;
                  },
                  decoration: InputDecoration(
                    label: Text(locale!.enterNameCollection),
                    errorText: collectionState.getCollectionState
                        ? locale.enterNameCollection
                        : null,
                  ),
                ),
                OutlinedButton(
                  onPressed: () async {
                    if (_textEditingCollection.text.isNotEmpty) {
                      if (_textEditingCollection.text != widget.model.title) {
                        final CollectionChangeEntity model = CollectionChangeEntity(
                          id: widget.model.id,
                          title: _textEditingCollection.text,
                        );
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: appColors.secondary,
                            duration: const Duration(milliseconds: 500),
                            content: SnackBarMessage(
                              message: locale.collectionChanged,
                            ),
                          ),
                        );
                        Provider.of<CollectionState>(context, listen: false).changeCollection(model: model);
                      }
                    } else if (_textEditingCollection.text.isEmpty) {
                      collectionState.setCollectionState = '';
                      _focusCollection.requestFocus();
                    }
                  },
                  child: Text(locale.add),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
