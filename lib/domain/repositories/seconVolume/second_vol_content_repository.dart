import 'package:arabicinyourhands/domain/entities/secondVolume/second_vol_content_entity.dart';

abstract class SecondVolContentRepository {
  Future<List<SecondVolContentEntity>> getSecondContents({required String tableName});

  Future<List<SecondVolContentEntity>> getSecondContentsById({required String tableName, required int secondSubChapterId});
}