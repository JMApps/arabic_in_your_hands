import 'package:arabicinyourhands/data/database/model/content_volume_one_arguments.dart';
import 'package:arabicinyourhands/data/database/model/volume_first_item_sub_chapter_model.dart';
import 'package:arabicinyourhands/data/database/service/database_query.dart';
import 'package:arabicinyourhands/domain/state/provider/main_navigation_selected_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FistVolumeSubChapterContentPage extends StatelessWidget {
  FistVolumeSubChapterContentPage({
    Key? key,
    required this.firstVolumeChapterId,
    required this.firstVolumeSubChapterIndex,
  }) : super(key: key);

  final int firstVolumeChapterId;
  final int firstVolumeSubChapterIndex;
  final _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: _databaseQuery.getAllFirstSubChapters(firstVolumeChapterId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var item = snapshot.data![firstVolumeSubChapterIndex] as VolumeFirstItemSubChapterModel;
          return Scaffold(
            appBar: AppBar(
              elevation: 1,
              centerTitle: true,
              title: Text(item.dialog),
              backgroundColor: const Color(0xFF243743),
              actions: [
                firstVolumeSubChapterIndex + 1 < snapshot.data!.length
                    ? IconButton(
                        icon: const Icon(
                          CupertinoIcons.forward,
                          size: 30,
                        ),
                        splashRadius: 20,
                        onPressed: () {
                          context.read<MainNavigationSelectedState>().updateFirstSelectedState(item.id + 1);
                          Navigator.pushReplacementNamed(context, '/first_volume_content',
                            arguments: ContentVolumeOneArguments(firstVolumeChapterId, firstVolumeSubChapterIndex + 1),
                          );
                        },
                      )
                    : const SizedBox(),
              ],
            ),
            body: Container(
              color: Colors.teal[100],
            ),
          );
        }
        return const Material(
          child: Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        );
      },
    );
  }
}
