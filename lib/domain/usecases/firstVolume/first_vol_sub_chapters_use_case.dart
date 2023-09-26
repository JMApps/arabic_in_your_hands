import 'package:arabicinyourhands/domain/entities/firstVolume/first_vol_sub_chapter_entity.dart';
import 'package:arabicinyourhands/domain/repositories/firstVolume/first_vol_sub_chapter_repository.dart';

class FirstVolSubChaptersUseCase {
  final FirstVolSubChaptersRepository _firstVolSubChaptersRepository;

  FirstVolSubChaptersUseCase(this._firstVolSubChaptersRepository);

  Future<List<FirstVolSubChapterEntity>> fetchFirstSubChapters({required String tableName}) async {
    try {
      final List<FirstVolSubChapterEntity> firstSubChapters = await _firstVolSubChaptersRepository.getFirstVolSubChapters(tableName: tableName);
      return firstSubChapters;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<FirstVolSubChapterEntity>> fetchFirstSubChaptersById({required String tableName, required int chapterId}) async {
    try {
      final List<FirstVolSubChapterEntity> firstSubChaptersById = await _firstVolSubChaptersRepository.getFirstVolSubChaptersById(tableName: tableName, chapterId: chapterId);
      return firstSubChaptersById;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
