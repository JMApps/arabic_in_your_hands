import 'package:arabicinyourhands/domain/entities/firstVolume/first_vol_content_entity.dart';

abstract class FirstVolContentRepository {
  Future<List<FirstVolContentEntity>> getFirstContents({required String tableName});

  Future<List<FirstVolContentEntity>> getFirstContentsById({required String tableName, required int firstSubChapterId});
}