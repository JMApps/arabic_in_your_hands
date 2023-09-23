import 'package:arabicinyourhands/domain/entities/secondVolume/second_vol_chapter_entity.dart';

abstract class SecondVolChaptersRepository {
  Future<List<SecondVolChapterEntity>> getSecondVolChapters();

  Future<List<SecondVolChapterEntity>> getSecondVolChaptersById({required int chapterId});
}
