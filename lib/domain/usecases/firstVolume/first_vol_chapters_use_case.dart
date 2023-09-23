
import 'package:arabicinyourhands/domain/entities/firstVolume/first_vol_chapter_entity.dart';
import 'package:arabicinyourhands/domain/repositories/firstVolume/first_vol_chapter_repository.dart';

class FirstVolChaptersUseCase {
  final FirstVolChaptersRepository _firstVolChaptersRepository;

  FirstVolChaptersUseCase(this._firstVolChaptersRepository);

  Future<List<FirstVolChapterEntity>> fetchFirstChapters() async {
    try {
      final List<FirstVolChapterEntity> firstChapters = await _firstVolChaptersRepository.getFirstVolChapters();
      return firstChapters;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<FirstVolChapterEntity>> fetchFirstChaptersById(
      {required int chapterId}) async {
    try {
      final List<FirstVolChapterEntity> firstChaptersById = await _firstVolChaptersRepository.getFirstVolChaptersById(chapterId: chapterId);
      return firstChaptersById;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
