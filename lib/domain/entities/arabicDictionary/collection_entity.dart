class CollectionEntity {
  final int id;
  final String title;
  final String addDateTime;
  final String changeDateTime;
  final int color;
  final int priority;

  const CollectionEntity({
    required this.id,
    required this.title,
    required this.addDateTime,
    required this.changeDateTime,
    required this.color,
    required this.priority,
  });
}
