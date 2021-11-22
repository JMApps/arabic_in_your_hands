import 'package:arabicinyourhands/model/content_volume_one_arguments.dart';
import 'package:arabicinyourhands/widgets/content_player.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ContentVolumeOne extends StatelessWidget {
  const ContentVolumeOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _arguments = ModalRoute.of(context)!.settings.arguments
        as ContentVolumeOneArguments?;
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              floating: true,
              pinned: false,
              snap: false,
              centerTitle: true,
              backgroundColor: const Color(0xFF696F76),
              title: Text('${_arguments!.dialog}'),
            ),
          ];
        },
        body: ScrollablePositionedList.builder(
          shrinkWrap: true,
          itemCount: 150,
          itemBuilder: (BuildContext context, int index) {
            return Text('$index');
          },
        ),
      ),
      bottomNavigationBar: Container(
        height: 65,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: const BoxDecoration(
          color: Color(0xFF696F76),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: const ContentPlayer(),
      ),
    );
  }
}
