import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;
  static Database? _db;
  final _databaseVersion = 1;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initializeDatabase();
    return _db!;
  }

  DatabaseHelper.internal();

  Future<Database> initializeDatabase() async {
    Directory? documentDirectory = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationSupportDirectory();

    String _path = join(documentDirectory!.path, 'ArabicInYourHandsDB.db');
    await deleteDatabase(_path);

    //String _toDelete_1 = '${documentDirectory.path}/fortress_db_2.db';

    //var _del_1 = await databaseExists(_toDelete_1);

    // if (_del_1) {
    //   await deleteDatabase(_toDelete_1);
    // }

    var _exists = await databaseExists(_path);

    if (!_exists) {
      try {
        await Directory(dirname(_path)).create(recursive: true);
      } catch (_) {
        Exception('Invalid database');
      }

      ByteData data = await rootBundle
          .load(join('assets/databases', 'ArabicInYourHandsDB.db'));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(_path).writeAsBytes(bytes, flush: true);
    }

    var _onOpen = await openDatabase(_path, version: _databaseVersion);
    return _onOpen;
  }
}
