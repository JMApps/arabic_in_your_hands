import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseUserDictionaryService {
  static final DatabaseUserDictionaryService _instance = DatabaseUserDictionaryService.internal();

  factory DatabaseUserDictionaryService() => _instance;
  static Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initializeDatabase();
    return _db!;
  }

  DatabaseUserDictionaryService.internal();

  Future<Database> initializeDatabase() async {
    Directory? documentDirectory = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationSupportDirectory();

    String pathDictionary = join(documentDirectory!.path, 'WordsDatabase.db');
    String pathDictionaryData = join('/data/data/jmapps.arabicinyourhands/databases', 'WordsDatabase');

    var existsDictionary = await databaseExists(pathDictionary);
    var existsDictionaryData = await databaseExists(pathDictionaryData);

    if (!existsDictionaryData) {
      if (!existsDictionary) {
        try {
          await Directory(dirname(pathDictionary)).create(recursive: true);
        } catch (_) {
          Exception('Invalid database from storage');
        }

        ByteData data = await rootBundle.load(join('assets/databases', 'WordsDatabase.db'));
        List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
        await File(pathDictionary).writeAsBytes(bytes, flush: true);
      }
    }

    var onOpen = await openDatabase(existsDictionaryData ? pathDictionaryData : pathDictionary);
    return onOpen;
  }
}
