import 'package:arabicinyourhands/data/datasources/services/database_content_service.dart';
import 'package:arabicinyourhands/data/models/secondVolume/second_vol_sub_chapter_model.dart';
import 'package:arabicinyourhands/domain/entities/secondVolume/second_vol_sub_chapter_entity.dart';
import 'package:arabicinyourhands/domain/repositories/seconVolume/second_vol_sub_chapter_repository.dart';
import 'package:sqflite/sqflite.dart';

class SecondVolSubChaptersDataRepository implements SecondVolSubChaptersRepository {

  final DatabaseContentService _databaseHelper = DatabaseContentService();

  static final SecondVolSubChaptersDataRepository _instance = SecondVolSubChaptersDataRepository._internal();

  SecondVolSubChaptersDataRepository._internal();

  static SecondVolSubChaptersDataRepository getInstance() {
    return _instance;
  }

  @override
  Future<List<SecondVolSubChapterEntity>> getSecondVolSubChapters({required String tableName}) async {
    final Database database = await _databaseHelper.db;
    List<Map<String, Object?>> resources = await database.query(tableName);
    List<SecondVolSubChapterEntity> secondVolumeSubChapters = resources.isNotEmpty ? resources.map((c) => _mapToEntity(SecondVolSubChapterModel.fromMap(c))).toList() : [];
    return secondVolumeSubChapters;
  }

  @override
  Future<List<SecondVolSubChapterEntity>> getSecondVolSubChaptersById({required String tableName, required int chapterId}) async {
    final Database database = await _databaseHelper.db;
    List<Map<String, Object?>> resources = await database.query(tableName, where: 'by_chapter_id = $chapterId');
    List<SecondVolSubChapterEntity> secondVolumeChaptersById = resources.isNotEmpty ? resources.map((c) => _mapToEntity(SecondVolSubChapterModel.fromMap(c))).toList() : [];
    return secondVolumeChaptersById;
  }

  // Mapping to entity
  SecondVolSubChapterEntity _mapToEntity(SecondVolSubChapterModel model) {
    return SecondVolSubChapterEntity(
      id: model.id,
      dialogTitle: model.dialogTitle,
      dialogSubTitle: model.dialogSubTitle,
    );
  }
}