class FirstVolSubChapterModel {
  final int id;
  final String dialogTitle;
  final String dialogSubTitle;

  const FirstVolSubChapterModel({
    required this.id,
    required this.dialogTitle,
    required this.dialogSubTitle,
  });

  factory FirstVolSubChapterModel.fromMap(Map<String, dynamic> map) {
    return FirstVolSubChapterModel(
      id: map['id'] as int,
      dialogTitle: map['dialog_title'] as String,
      dialogSubTitle: map['dialog_sub_title'] as String,
    );
  }
}
