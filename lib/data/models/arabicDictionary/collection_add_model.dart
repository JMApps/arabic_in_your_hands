class CollectionAddModel {
  final String title;

  const CollectionAddModel({
    required this.title,
  });

  factory CollectionAddModel.fromMap(Map<String, dynamic> map) {
    return CollectionAddModel(
      title: map['title'] as String,
    );
  }
}
