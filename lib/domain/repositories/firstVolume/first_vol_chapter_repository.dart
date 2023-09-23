import 'package:arabicinyourhands/domain/entities/firstVolume/first_vol_chapter_entity.dart';

abstract class FirstVolChaptersRepository {
  Future<List<FirstVolChapterEntity>> getFirstVolChapters({required String tableName});

  Future<List<FirstVolChapterEntity>> getFirstVolChaptersById({required String tableName, required int chapterId});
}
