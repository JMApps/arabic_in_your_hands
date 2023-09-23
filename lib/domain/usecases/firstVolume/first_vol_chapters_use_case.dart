
import 'package:arabicinyourhands/domain/entities/firstVolume/first_vol_chapter_entity.dart';
import 'package:arabicinyourhands/domain/repositories/firstVolume/first_vol_chapter_repository.dart';

class FirstVolChaptersUseCase {
  final FirstVolChaptersRepository _firstVolChaptersRepository;

  FirstVolChaptersUseCase(this._firstVolChaptersRepository);

  Future<List<FirstVolChapterEntity>> fetchFirstChapters({required String tableName}) async {
    try {
      final List<FirstVolChapterEntity> firstChapters = await _firstVolChaptersRepository.getFirstVolChapters(tableName: tableName);
      return firstChapters;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<FirstVolChapterEntity>> fetchFirstChaptersById({required String tableName, required int chapterId}) async {
    try {
      final List<FirstVolChapterEntity> firstChaptersById = await _firstVolChaptersRepository.getFirstVolChaptersById(tableName: tableName, chapterId: chapterId);
      return firstChaptersById;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
