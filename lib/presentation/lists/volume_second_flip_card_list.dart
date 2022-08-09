import 'package:arabicinyourhands/data/database/service/database_query.dart';
import 'package:arabicinyourhands/domain/state/provider/flip_page_state.dart';
import 'package:arabicinyourhands/presentation/items/second_volume_flip_card_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class VolumeSecondFlipCardList extends StatelessWidget {
  VolumeSecondFlipCardList({
    Key? key,
    required this.secondVolumeSubChapterId,
  }) : super(key: key);

  final int secondVolumeSubChapterId;
  final _databaseQuery = DatabaseQuery();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _databaseQuery.getAllVolumeSecondChapterContent(secondVolumeSubChapterId),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return SecondVolumeFlipCardItem(
                          item: snapshot.data![index],
                        );
                      },
                      onPageChanged: (int pageNumber) {
                        context.read<FlipPageState>().changeSecondVolumePageIndex(pageNumber);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: AnimatedSmoothIndicator(
                      activeIndex: context.watch<FlipPageState>().getCurrentFirstVolumePageIndex,
                      count: snapshot.data!.length,
                      effect: const ScrollingDotsEffect(
                          dotWidth: 8,
                          dotHeight: 8,
                          paintStyle: PaintingStyle.fill,
                          strokeWidth: 1.5,
                          dotColor: Color(0xFF00A178),
                          activeDotColor: Color(0xFF243743),
                      ),
                    ),
                  )
                ],
              )
            : const Center(
                child: CircularProgressIndicator.adaptive(),
              );
      },
    );
  }
}
