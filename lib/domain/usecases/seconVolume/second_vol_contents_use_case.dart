import 'package:arabicinyourhands/domain/entities/secondVolume/second_vol_content_entity.dart';
import 'package:arabicinyourhands/domain/repositories/seconVolume/second_vol_content_repository.dart';

class SecondVolContentsUseCase {
  final SecondVolContentRepository _secondVolContentRepository;

  SecondVolContentsUseCase(this._secondVolContentRepository);

  Future<List<SecondVolContentEntity>> fetchSecondContents({required String tableName}) async {
    try {
      final List<SecondVolContentEntity> secondContents = await _secondVolContentRepository.getSecondContents(tableName: tableName);
      return secondContents;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<SecondVolContentEntity>> fetchSecondContentsById({required String tableName, required int secondSubChapterId}) async {
    try {
      final List<SecondVolContentEntity> secondContentsById = await _secondVolContentRepository.getSecondContentsById(tableName: tableName, secondSubChapterId: secondSubChapterId);
      return secondContentsById;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}