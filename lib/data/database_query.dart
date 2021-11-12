import 'package:arabicinyourhands/model/volume_first_item_chapter_model.dart';
import 'package:arabicinyourhands/model/volume_first_item_sub_chapter_model.dart';

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
}
