import 'package:arabicinyourhands/data/datasources/services/database_content_service.dart';
import 'package:arabicinyourhands/data/models/secondVolume/second_vol_content_model.dart';
import 'package:arabicinyourhands/domain/entities/secondVolume/second_vol_content_entity.dart';
import 'package:arabicinyourhands/domain/repositories/seconVolume/second_vol_content_repository.dart';
import 'package:sqflite/sqlite_api.dart';

class SecondVolContentsDataRepository implements SecondVolContentRepository {

  final DatabaseContentService _databaseHelper = DatabaseContentService();

  static final SecondVolContentsDataRepository _instance = SecondVolContentsDataRepository._internal();

  SecondVolContentsDataRepository._internal();

  static SecondVolContentsDataRepository getInstance() {
    return _instance;
  }

  @override
  Future<List<SecondVolContentEntity>> getSecondContents({required String tableName}) async {
    final Database database = await _databaseHelper.db;
    List<Map<String, Object?>> resources = await database.query(tableName);
    List<SecondVolContentEntity> secondVolumeContents = resources.isNotEmpty ? resources.map((c) => _mapToEntity(SecondVolContentModel.fromMap(c))).toList() : [];
    return secondVolumeContents;
  }

  @override
  Future<List<SecondVolContentEntity>> getSecondContentsById({required String tableName, required int secondSubChapterId}) async {
    final Database database = await _databaseHelper.db;
    List<Map<String, Object?>> resources = await database.query(tableName, where: 'by_sub_chapter_id = $secondSubChapterId');
    List<SecondVolContentEntity> secondVolumeContentsById = resources.isNotEmpty ? resources.map((c) => _mapToEntity(SecondVolContentModel.fromMap(c))).toList() : [];
    return secondVolumeContentsById;
  }

  // Mapping to entity
  SecondVolContentEntity _mapToEntity(SecondVolContentModel model) {
    return SecondVolContentEntity(
      id: model.id,
      arabicName: model.arabicName,
      arabicContent: model.arabicContent,
      translationName: model.translationName,
      translationContent: model.translationContent,
      audioName: model.audioName,
    );
  }
}
