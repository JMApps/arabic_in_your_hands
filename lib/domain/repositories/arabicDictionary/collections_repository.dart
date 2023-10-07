import 'package:arabicinyourhands/domain/entities/arabicDictionary/collection_add_entity.dart';
import 'package:arabicinyourhands/domain/entities/arabicDictionary/collection_change_entity.dart';
import 'package:arabicinyourhands/domain/entities/arabicDictionary/collection_entity.dart';

abstract class CollectionsRepository {
  Future<List<CollectionEntity>> getAllCollections();

  Future<CollectionEntity> getCollectionById({required int collectionId});

  Future<int> addCollection({required CollectionAddEntity collectionEntity});

  Future<int> changeCollection({required CollectionChangeEntity collectionEntity});

  Future<int> deleteCollection({required int collectionId});

  Future<int> deleteAllCollections();
}