class CollectionChangeModel {
  final int id;
  final String title;

  const CollectionChangeModel({
    required this.id,
    required this.title,
  });

  factory CollectionChangeModel.fromMap(Map<String, dynamic> map) {
    return CollectionChangeModel(
      id: map['id'],
      title: map['title'] as String,
    );
  }
}
