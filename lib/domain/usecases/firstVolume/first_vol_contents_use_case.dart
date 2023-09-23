import 'package:arabicinyourhands/domain/entities/firstVolume/first_vol_content_entity.dart';
import 'package:arabicinyourhands/domain/repositories/firstVolume/first_vol_content_repository.dart';

class FirstVolContentsUseCase {
  final FirstVolContentRepository _firstVolContentRepository;

  FirstVolContentsUseCase(this._firstVolContentRepository);

  Future<List<FirstVolContentEntity>> fetchFirstContents({required String tableName}) async {
    try {
      final List<FirstVolContentEntity> firstContents = await _firstVolContentRepository.getFirstContents(tableName: tableName);
      return firstContents;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<FirstVolContentEntity>> fetchFirstContentsById({required String tableName, required int firstSubChapterId}) async {
    try {
      final List<FirstVolContentEntity> firstContentsById = await _firstVolContentRepository.getFirstContentsById(tableName: tableName, firstSubChapterId: firstSubChapterId);
      return firstContentsById;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}