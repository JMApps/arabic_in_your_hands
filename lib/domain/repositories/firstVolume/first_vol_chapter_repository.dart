import 'package:arabicinyourhands/domain/entities/firstVolume/first_vol_chapter_entity.dart';

abstract class FirstVolChaptersRepository {
  Future<List<FirstVolChapterEntity>> getFirstVolChapters();

  Future<List<FirstVolChapterEntity>> getFirstVolChaptersById({required int chapterId});
}
