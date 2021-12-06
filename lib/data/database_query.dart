import 'package:arabicinyourhands/model/volume_first_item_chapter_content_model.dart';
import 'package:arabicinyourhands/model/volume_first_item_chapter_model.dart';
import 'package:arabicinyourhands/model/volume_first_item_sub_chapter_model.dart';
import 'package:arabicinyourhands/model/volume_second_item_chapter_content_model.dart';
import 'package:arabicinyourhands/model/volume_second_item_chapter_model.dart';
import 'package:arabicinyourhands/model/volume_second_item_sub_chapter_model.dart';

import 'database_helper.dart';

class DatabaseQuery {
  DatabaseHelper con = DatabaseHelper();

  Future<List<VolumeFirstItemChapterModel>> getAllFirstChapters() async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_first_chapters');
    List<VolumeFirstItemChapterModel>? firstVolumeChapters = res.isNotEmpty ? res.map((c) => VolumeFirstItemChapterModel.fromMap(c)).toList() : null;
    return firstVolumeChapters!;
  }

  Future<List<VolumeFirstItemSubChapterModel>> getAllFirstSubChapters(int index) async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_first_sub_chapters', where: 'DisplayBy == $index');
    List<VolumeFirstItemSubChapterModel>? firstVolumeChapters = res.isNotEmpty ? res.map((c) => VolumeFirstItemSubChapterModel.fromMap(c)).toList() : null;
    return firstVolumeChapters!;
  }

  Future<List<VolumeSecondItemChapterModel>> getAllSecondChapters() async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_second_chapters');
    List<VolumeSecondItemChapterModel>? firstVolumeChapters = res.isNotEmpty ? res.map((c) => VolumeSecondItemChapterModel.fromMap(c)).toList() : null;
    return firstVolumeChapters!;
  }

  Future<List<VolumeSecondItemSubChapterModel>> getAllSecondSubChapters(int index) async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_second_sub_chapters', where: 'DisplayBy == $index');
    List<VolumeSecondItemSubChapterModel>? firstVolumeChapters = res.isNotEmpty ? res.map((c) => VolumeSecondItemSubChapterModel.fromMap(c)).toList() : null;
    return firstVolumeChapters!;
  }

  Future<List<VolumeFirstItemChapterContentModel>> getAllVolumeFirstChapterContent(int index) async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_first_contents', where: 'DisplayBy == $index');
    List<VolumeFirstItemChapterContentModel>? firstVolumeChapters = res.isNotEmpty ? res.map((c) => VolumeFirstItemChapterContentModel.fromMap(c)).toList() : null;
    return firstVolumeChapters!;
  }

  Future<List<VolumeSecondItemChapterContentModel>> getAllVolumeSecondChapterContent(int index) async {
    var dbClient = await con.db;
    var res = await dbClient.query('Table_of_second_contents', where: 'DisplayBy == $index');
    List<VolumeSecondItemChapterContentModel>? firstVolumeChapters = res.isNotEmpty ? res.map((c) => VolumeSecondItemChapterContentModel.fromMap(c)).toList() : null;
    return firstVolumeChapters!;
  }
}