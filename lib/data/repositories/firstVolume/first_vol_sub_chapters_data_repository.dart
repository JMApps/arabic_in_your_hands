import 'package:arabicinyourhands/data/datasources/services/database_content_service.dart';
import 'package:arabicinyourhands/data/models/firstVolume/first_vol_sub_chapter_model.dart';
import 'package:arabicinyourhands/domain/entities/firstVolume/first_vol_sub_chapter_entity.dart';
import 'package:arabicinyourhands/domain/repositories/firstVolume/first_vol_sub_chapter_repository.dart';
import 'package:sqflite/sqflite.dart';

class FirstVolSubChaptersDataRepository implements FirstVolSubChaptersRepository {

  final DatabaseContentService _databaseHelper = DatabaseContentService();

  @override
  Future<List<FirstVolSubChapterEntity>> getFirstVolSubChapters({required String tableName}) async {
    final Database database = await _databaseHelper.db;
    List<Map<String, Object?>> resources = await database.query(tableName);
    List<FirstVolSubChapterEntity>? firstVolumeSubChapters = resources.isNotEmpty ? resources.map((c) => _mapToEntity(FirstVolSubChapterModel.fromMap(c))).toList() : [];
    return firstVolumeSubChapters;
  }

  @override
  Future<List<FirstVolSubChapterEntity>> getFirstVolSubChaptersById({required String tableName, required int chapterId}) async {
    final Database database = await _databaseHelper.db;
    List<Map<String, Object?>> resources = await database.query(tableName, where: 'by_chapter_id = $chapterId');
    List<FirstVolSubChapterEntity>? firstVolumeSubChaptersById = resources.isNotEmpty ? resources.map((c) => _mapToEntity(FirstVolSubChapterModel.fromMap(c))).toList() : [];
    return firstVolumeSubChaptersById;
  }

  // Mapping to entity
  FirstVolSubChapterEntity _mapToEntity(FirstVolSubChapterModel model) {
    return FirstVolSubChapterEntity(
      id: model.id,
      dialogTitle: model.dialogTitle,
      dialogSubTitle: model.dialogSubTitle,
    );
  }
}