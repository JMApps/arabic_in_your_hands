class CollectionModel {
  final int id;
  final String title;
  final String addDateTime;
  final String changeDateTime;
  final int color;
  final int priority;

  const CollectionModel({
    required this.id,
    required this.title,
    required this.addDateTime,
    required this.changeDateTime,
    required this.color,
    required this.priority,
  });

  factory CollectionModel.fromMap(Map<String, dynamic> map) {
    return CollectionModel(
      id: map['id'] as int,
      title: map['title'] as String,
      addDateTime: map['add_date_time'] as String,
      changeDateTime: map['change_date_time'] as String,
      color: map['color'] as int,
      priority: map['priority'] as int,
    );
  }
}
