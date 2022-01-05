import 'package:arabicinyourhands/model/dictionary_category_model.dart';

import 'database_helper.dart';

class DictionaryDatabaseQuery {
  DatabaseHelper con = DatabaseHelper();

  Future<List<DictionaryCategoryModel>> getAllCategories() async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_word_categories');
    List<DictionaryCategoryModel>? categories = res.isNotEmpty ? res.map((c) => DictionaryCategoryModel.fromMap(c)).toList() : null;
    return categories!;
  }

  // Future<List<VolumeFirstItemSubChapterModel>> getAllFirstSubChapters(int index) async {
  //   var dbClient = await con.db;
  //   var res = await dbClient.query('Table_of_first_sub_chapters', where: 'DisplayBy == $index');
  //   List<VolumeFirstItemSubChapterModel>? firstVolumeChapters = res.isNotEmpty ? res.map((c) => VolumeFirstItemSubChapterModel.fromMap(c)).toList() : null;
  //   return firstVolumeChapters!;
  // }
  //
  // Future<List<VolumeSecondItemChapterModel>> getAllSecondChapters() async {
  //   var dbClient = await con.db;
  //   var res = await dbClient.query('Table_of_second_chapters');
  //   List<VolumeSecondItemChapterModel>? firstVolumeChapters = res.isNotEmpty ? res.map((c) => VolumeSecondItemChapterModel.fromMap(c)).toList() : null;
  //   return firstVolumeChapters!;
  // }
  //
  // Future<List<VolumeSecondItemSubChapterModel>> getAllSecondSubChapters(int index) async {
  //   var dbClient = await con.db;
  //   var res = await dbClient.query('Table_of_second_sub_chapters', where: 'DisplayBy == $index');
  //   List<VolumeSecondItemSubChapterModel>? firstVolumeChapters = res.isNotEmpty ? res.map((c) => VolumeSecondItemSubChapterModel.fromMap(c)).toList() : null;
  //   return firstVolumeChapters!;
  // }
  //
  // Future<List<VolumeFirstItemChapterContentModel>> getAllVolumeFirstChapterContent(int index) async {
  //   var dbClient = await con.db;
  //   var res = await dbClient.query('Table_of_first_contents', where: 'DisplayBy == $index');
  //   List<VolumeFirstItemChapterContentModel>? firstVolumeChapters = res.isNotEmpty ? res.map((c) => VolumeFirstItemChapterContentModel.fromMap(c)).toList() : null;
  //   return firstVolumeChapters!;
  // }
  //
  // Future<List<VolumeSecondItemChapterContentModel>> getAllVolumeSecondChapterContent(int index) async {
  //   var dbClient = await con.db;
  //   var res = await dbClient.query('Table_of_second_contents', where: 'DisplayBy == $index');
  //   List<VolumeSecondItemChapterContentModel>? firstVolumeChapters = res.isNotEmpty ? res.map((c) => VolumeSecondItemChapterContentModel.fromMap(c)).toList() : null;
  //   return firstVolumeChapters!;
  // }
}