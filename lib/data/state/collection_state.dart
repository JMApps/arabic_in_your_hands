import 'package:arabicinyourhands/data/repositories/arabicDictionary/collections_data_repository.dart';
import 'package:arabicinyourhands/domain/entities/arabicDictionary/collection_add_entity.dart';
import 'package:arabicinyourhands/domain/entities/arabicDictionary/collection_change_entity.dart';
import 'package:arabicinyourhands/domain/entities/arabicDictionary/collection_entity.dart';
import 'package:arabicinyourhands/domain/usecases/arabicDictionary/coolections_use_case.dart';
import 'package:flutter/material.dart';

class CollectionState extends ChangeNotifier {
  final CollectionsUseCase _collectionsUseCase = CollectionsUseCase(CollectionsDataReposioty());

  Future<List<CollectionEntity>> fetchAllCollections() async {
    final List<CollectionEntity> allCollections = await _collectionsUseCase.fetchAllCollections();
    return allCollections;
  }

  Future<CollectionEntity> fetchCollectionById({required int collectionId}) async {
    final CollectionEntity collectionById = await _collectionsUseCase.fetchCollectionById(collectionId: collectionId);
    return collectionById;
  }

  Future<int> addCollection({required CollectionAddEntity model}) async {
    final int newCollection = await _collectionsUseCase.addCollection(collectionEntity: model);
    notifyListeners();
    return newCollection;
  }

  Future<int> changeCollection({required CollectionChangeEntity model}) async {
    final int changeCollection = await _collectionsUseCase.changeCollection(collectionEntity: model);
    notifyListeners();
    return changeCollection;
  }

  Future<int> deleteCollection({required int collectionId}) async {
    final int deleteCollection = await _collectionsUseCase.deleteCollection(collectionId: collectionId);
    notifyListeners();
    return deleteCollection;
  }

  Future<int> deleteAllCollections() async {
    final int deleteAllCollections = await _collectionsUseCase.deleteAllCollections();
    notifyListeners();
    return deleteAllCollections;
  }
}
