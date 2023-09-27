import 'package:arabicinyourhands/data/datasources/services/database_content_service.dart';
import 'package:arabicinyourhands/data/models/firstVolume/first_vol_content_model.dart';
import 'package:arabicinyourhands/domain/entities/firstVolume/first_vol_content_entity.dart';
import 'package:arabicinyourhands/domain/repositories/firstVolume/first_vol_content_repository.dart';
import 'package:sqflite/sqlite_api.dart';

class FirstVolContentsDataRepository implements FirstVolContentRepository {

  final DatabaseContentService _databaseHelper = DatabaseContentService();

  static final FirstVolContentsDataRepository _instance = FirstVolContentsDataRepository._internal();

  FirstVolContentsDataRepository._internal();

  static FirstVolContentsDataRepository getInstance() {
    return _instance;
  }

  @override
  Future<List<FirstVolContentEntity>> getFirstContents({required String tableName}) async {
    final Database database = await _databaseHelper.db;
    List<Map<String, Object?>> resources = await database.query(tableName);
    List<FirstVolContentEntity> firstVolumeContents = resources.isNotEmpty ? resources.map((c) => _mapToEntity(FirstVolContentModel.fromMap(c))).toList() : [];
    return firstVolumeContents;
  }

  @override
  Future<List<FirstVolContentEntity>> getFirstContentsById({required String tableName, required int firstSubChapterId}) async {
    final Database database = await _databaseHelper.db;
    List<Map<String, Object?>> resources = await database.query(tableName, where: 'by_sub_chapter_id = $firstSubChapterId');
    List<FirstVolContentEntity> firstVolumeContentsById = resources.isNotEmpty ? resources.map((c) => _mapToEntity(FirstVolContentModel.fromMap(c))).toList() : [];
    return firstVolumeContentsById;
  }

  // Mapping to entity
  FirstVolContentEntity _mapToEntity(FirstVolContentModel model) {
    return FirstVolContentEntity(
      id: model.id,
      arabicName: model.arabicName,
      arabicContent: model.arabicContent,
      translationName: model.translationName,
      translationContent: model.translationContent,
      audioName: model.audioName,
    );
  }
}
