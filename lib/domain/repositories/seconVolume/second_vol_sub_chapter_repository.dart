
import 'package:arabicinyourhands/domain/entities/secondVolume/second_vol_sub_chapter_entity.dart';

abstract class SecondVolSubChaptersRepository {
  Future<List<SecondVolSubChapterEntity>> getSecondVolSubChapters({required String tableName});

  Future<List<SecondVolSubChapterEntity>> getSecondVolSubChaptersById({required String tableName, required int chapterId});
}
