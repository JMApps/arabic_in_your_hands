
import 'package:arabicinyourhands/domain/entities/secondVolume/second_vol_chapter_entity.dart';
import 'package:arabicinyourhands/domain/repositories/seconVolume/second_vol_chapter_repository.dart';

class SecondVolChaptersUseCase {
  final SecondVolChaptersRepository _secondVolChaptersRepository;

  SecondVolChaptersUseCase(this._secondVolChaptersRepository);

  Future<List<SecondVolChapterEntity>> fetchSecondChapters({required String tableName}) async {
    try {
      final List<SecondVolChapterEntity> secondChapters = await _secondVolChaptersRepository.getSecondVolChapters(tableName: tableName);
      return secondChapters;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<SecondVolChapterEntity>> fetchSecondChaptersById({required String tableName, required int chapterId}) async {
    try {
      final List<SecondVolChapterEntity> secondChaptersById = await _secondVolChaptersRepository.getSecondVolChaptersById(tableName: tableName, chapterId: chapterId);
      return secondChaptersById;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
