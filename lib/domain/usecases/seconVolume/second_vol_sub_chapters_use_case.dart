import 'package:arabicinyourhands/domain/entities/secondVolume/second_vol_sub_chapter_entity.dart';
import 'package:arabicinyourhands/domain/repositories/seconVolume/second_vol_sub_chapter_repository.dart';

class SecondVolSubChaptersUseCase {
  final SecondVolSubChaptersRepository _secondVolSubChaptersRepository;

  SecondVolSubChaptersUseCase(this._secondVolSubChaptersRepository);

  Future<List<SecondVolSubChapterEntity>> fetchSecondSubChapters({required String tableName}) async {
    try {
      final List<SecondVolSubChapterEntity> secondSubChapters = await _secondVolSubChaptersRepository.getSecondVolSubChapters(tableName: tableName);
      return secondSubChapters;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<SecondVolSubChapterEntity>> fetchSecondSubChaptersById({required String tableName, required int chapterId}) async {
    try {
      final List<SecondVolSubChapterEntity> secondSubChaptersById = await _secondVolSubChaptersRepository.getSecondVolSubChaptersById(tableName: tableName, chapterId: chapterId);
      return secondSubChaptersById;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
