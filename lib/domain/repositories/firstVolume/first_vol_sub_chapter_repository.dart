
import 'package:arabicinyourhands/domain/entities/firstVolume/first_vol_sub_chapter_entity.dart';

abstract class FirstVolSubChaptersRepository {
  Future<List<FirstVolSubChapterEntity>> getFirstVolSubChapters({required String tableName});

  Future<List<FirstVolSubChapterEntity>> getFirstVolSubChaptersById({required String tableName, required int chapterId});
}
