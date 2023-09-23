import 'package:arabicinyourhands/domain/entities/secondVolume/second_vol_chapter_entity.dart';

abstract class SecondVolChaptersRepository {
  Future<List<SecondVolChapterEntity>> getSecondVolChapters({required String tableName});

  Future<List<SecondVolChapterEntity>> getSecondVolChaptersById({required String tableName, required int chapterId});
}
