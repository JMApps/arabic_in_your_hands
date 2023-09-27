import 'package:arabicinyourhands/data/datasources/services/database_content_service.dart';
import 'package:arabicinyourhands/data/models/firstVolume/first_vol_chapter_model.dart';
import 'package:arabicinyourhands/domain/entities/firstVolume/first_vol_chapter_entity.dart';
import 'package:arabicinyourhands/domain/repositories/firstVolume/first_vol_chapter_repository.dart';
import 'package:sqflite/sqflite.dart';

class FirstVolChaptersDataRepository implements FirstVolChaptersRepository {

  final DatabaseContentService _databaseHelper = DatabaseContentService();

  static final FirstVolChaptersDataRepository _instance = FirstVolChaptersDataRepository._internal();

  FirstVolChaptersDataRepository._internal();

  static FirstVolChaptersDataRepository getInstance() {
    return _instance;
  }

  @override
  Future<List<FirstVolChapterEntity>> getFirstVolChapters({required String tableName}) async {
    final Database database = await _databaseHelper.db;
    List<Map<String, Object?>> resources = await database.query(tableName);
    List<FirstVolChapterEntity>? firstVolumeChapters = resources.isNotEmpty ? resources.map((c) => _mapToEntity(FirstVolChapterModel.fromMap(c))).toList() : [];
    return firstVolumeChapters;
  }

  @override
  Future<List<FirstVolChapterEntity>> getFirstVolChaptersById({required String tableName, required int chapterId}) async {
    final Database database = await _databaseHelper.db;
    List<Map<String, Object?>> resources = await database.query(tableName, where: 'id = $chapterId');
    List<FirstVolChapterEntity>? firstVolumeChaptersById = resources.isNotEmpty ? resources.map((c) => _mapToEntity(FirstVolChapterModel.fromMap(c))).toList() : [];
    return firstVolumeChaptersById;
  }

  // Mapping to entity
  FirstVolChapterEntity _mapToEntity(FirstVolChapterModel model) {
    return FirstVolChapterEntity(
      id: model.id,
      chapterTitle: model.chapterTitle,
      chapterTitleArabic: model.chapterTitleArabic,
    );
  }
}