import 'package:arabicinyourhands/domain/entities/firstVolume/first_vol_sub_chapter_entity.dart';
import 'package:arabicinyourhands/domain/repositories/firstVolume/first_vol_sub_chapter_repository.dart';

class FirstVolSubChaptersUseCase {
  final FirstVolSubChaptersRepository _firstVolSubChaptersRepository;

  FirstVolSubChaptersUseCase(this._firstVolSubChaptersRepository);

  Future<List<FirstVolSubChapterEntity>> fetchFirstSubChapters() async {
    try {
      final List<FirstVolSubChapterEntity> firstSubChapters = await _firstVolSubChaptersRepository.getFirstVolSubChapters();
      return firstSubChapters;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<FirstVolSubChapterEntity>> fetchFirstChaptersById({required int chapterId}) async {
    try {
      final List<FirstVolSubChapterEntity> firstSubChaptersById = await _firstVolSubChaptersRepository.getFirstVolSubChaptersById(chapterId: chapterId);
      return firstSubChaptersById;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
