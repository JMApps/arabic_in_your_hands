
import 'package:arabicinyourhands/domain/entities/secondVolume/second_vol_sub_chapter_entity.dart';

abstract class SecondVolSubChaptersRepository {
  Future<List<SecondVolSubChapterEntity>> getSecondVolSubChapters();

  Future<List<SecondVolSubChapterEntity>> getSecondVolSubChaptersById({required int chapterId});
}
