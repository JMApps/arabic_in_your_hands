import 'package:arabicinyourhands/domain/entities/arabicDictionary/collection_add_entity.dart';
import 'package:arabicinyourhands/domain/entities/arabicDictionary/collection_change_entity.dart';
import 'package:arabicinyourhands/domain/entities/arabicDictionary/collection_entity.dart';
import 'package:arabicinyourhands/domain/repositories/arabicDictionary/collections_repository.dart';

class CollectionsUseCase {
  final CollectionsRepository _collectionsRepository;

  CollectionsUseCase(this._collectionsRepository);

  Future<List<CollectionEntity>> fetchAllCollections() async {
    try {
      final List<CollectionEntity> allColletions = await _collectionsRepository.getAllCollections();
      return allColletions;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<CollectionEntity> fetchCollectionById({required int collectionId}) async {
    try {
      final CollectionEntity collectionById = await _collectionsRepository.getCollectionById(collectionId: collectionId);
      return collectionById;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<int> addCollection({required CollectionAddEntity collectionEntity}) async {
    try {
      final int addCollections = await _collectionsRepository.addCollection(collectionEntity: collectionEntity);
      return addCollections;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<int> changeCollection({required CollectionChangeEntity collectionEntity}) async {
    try {
      final int changeCollections = await _collectionsRepository.changeCollection(collectionEntity: collectionEntity);
      return changeCollections;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<int> deleteCollection({required int collectionId}) async {
    try {
      final int deleteColletion = await _collectionsRepository.deleteCollection(collectionId: collectionId);
      return deleteColletion;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<int> deleteAllCollections() async {
    try {
      final int deleteAllColletions = await _collectionsRepository.deleteAllCollections();
      return deleteAllColletions;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}