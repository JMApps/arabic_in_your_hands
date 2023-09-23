class SecondVolSubChapterModel {
  final int id;
  final String dialogTitle;
  final String dialogSubTitle;

  const SecondVolSubChapterModel({
    required this.id,
    required this.dialogTitle,
    required this.dialogSubTitle,
  });

  factory SecondVolSubChapterModel.fromMap(Map<String, dynamic> map) {
    return SecondVolSubChapterModel(
      id: map['id'] as int,
      dialogTitle: map['dialog_title'] as String,
      dialogSubTitle: map['dialog_sub_title'] as String,
    );
  }
}
