import 'package:arabicinyourhands/data/datasources/services/database_content_service.dart';
import 'package:arabicinyourhands/data/models/secondVolume/second_vol_chapter_model.dart';
import 'package:arabicinyourhands/domain/entities/secondVolume/second_vol_chapter_entity.dart';
import 'package:arabicinyourhands/domain/repositories/seconVolume/second_vol_chapter_repository.dart';
import 'package:sqflite/sqflite.dart';

class SecondVolChaptersDataRepository implements SecondVolChaptersRepository {

  final DatabaseContentService _databaseHelper = DatabaseContentService();

  @override
  Future<List<SecondVolChapterEntity>> getSecondVolChapters({required String tableName}) async {
    final Database database = await _databaseHelper.db;
    List<Map<String, Object?>> resources = await database.query(tableName);
    List<SecondVolChapterEntity> secondVolumeChapters = resources.isNotEmpty ? resources.map((c) => _mapToEntity(SecondVolChapterModel.fromMap(c))).toList() : [];
    return secondVolumeChapters;
  }

  @override
  Future<List<SecondVolChapterEntity>> getSecondVolChaptersById({required String tableName, required int chapterId}) async {
    final Database database = await _databaseHelper.db;
    List<Map<String, Object?>> resources = await database.query(tableName, where: 'id = $chapterId');
    List<SecondVolChapterEntity> secondVolumeChaptersById = resources.isNotEmpty ? resources.map((c) => _mapToEntity(SecondVolChapterModel.fromMap(c))).toList() : [];
    return secondVolumeChaptersById;
  }

  // Mapping to entity
  SecondVolChapterEntity _mapToEntity(SecondVolChapterModel model) {
    return SecondVolChapterEntity(
      id: model.id,
      chapterTitle: model.chapterTitle,
      chapterTitleArabic: model.chapterTitleArabic,
    );
  }
}