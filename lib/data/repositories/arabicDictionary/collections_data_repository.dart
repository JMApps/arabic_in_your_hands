import 'package:arabicinyourhands/data/datasources/services/database_collections_service.dart';
import 'package:arabicinyourhands/data/models/arabicDictionary/collection_model.dart';
import 'package:arabicinyourhands/domain/entities/arabicDictionary/collection_add_entity.dart';
import 'package:arabicinyourhands/domain/entities/arabicDictionary/collection_change_entity.dart';
import 'package:arabicinyourhands/domain/entities/arabicDictionary/collection_entity.dart';
import 'package:arabicinyourhands/domain/repositories/arabicDictionary/collections_repository.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqflite.dart' as sql;

class CollectionsDataReposioty implements CollectionsRepository {
  final DatabaseCollectionsService _databaseCollectionsService = DatabaseCollectionsService();

  @override
  Future<List<CollectionEntity>> getAllCollections() async {
    final Database database = await _databaseCollectionsService.db;
    final List<Map<String, Object?>> resources = await database.query('Table_of_collections');
    final List<CollectionEntity> allCollections = resources.isNotEmpty ? resources.map((c) => _mapToEntity(CollectionModel.fromMap(c))).toList() : [];
    return allCollections;
  }

  @override
  Future<CollectionEntity> getCollectionById({required int collectionId}) async {
    final Database database = await _databaseCollectionsService.db;
    final List<Map<String, Object?>> resources = await database.query('Table_of_collections', where: 'id = $collectionId');
    final CollectionEntity? collectionById = resources.isNotEmpty ? _mapToEntity(CollectionModel.fromMap(resources.first)) : null;
    return collectionById!;
  }

  @override
  Future<int> addCollection({required CollectionAddEntity collectionEntity}) async {
    final Database database = await _databaseCollectionsService.db;
    final Map<String, dynamic> collection = {
      'title': collectionEntity.title,
      'add_date_time': DateTime.now().toString(),
      'change_date_time': DateTime.now().toString(),
      'color': Colors.grey.value,
      'priority': 0,
    };
    final int newCollection = await database.insert('Table_of_collections', collection, conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return newCollection;
  }

  @override
  Future<int> changeCollection({required CollectionChangeEntity collectionEntity}) async {
    final Database dbClient = await _databaseCollectionsService.db;
    final Map<String, dynamic> collection = {
      'title': collectionEntity.title,
      'change_date_time': DateTime.now().toString(),
    };
    final int changeCollection = await dbClient.update('Table_of_word_categories', collection, where: 'id = ${collectionEntity.id}', conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return changeCollection;
  }

  @override
  Future<int> deleteCollection({required int collectionId}) async {
    final Database dbClient = await _databaseCollectionsService.db;
    final int deleteCollection = await dbClient.delete('Table_of_word_categories',where: 'id = $collectionId');
    return deleteCollection;
  }

  @override
  Future<int> deleteAllCollections() async {
    final Database dbClient = await _databaseCollectionsService.db;
    final int deleteAllCollections = await dbClient.delete('Table_of_word_categories');
    return deleteAllCollections;
  }

  // Mapping to entity
  CollectionEntity _mapToEntity(CollectionModel model) {
    return CollectionEntity(
      id: model.id,
      title: model.title,
      addDateTime: model.addDateTime,
      changeDateTime: model.changeDateTime,
      color: model.color,
      priority: model.priority,
    );
  }
}
