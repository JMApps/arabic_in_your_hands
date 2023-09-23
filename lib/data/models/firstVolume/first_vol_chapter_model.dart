class FirstVolChapterModel {
  final int id;
  final String chapterTitle;
  final String chapterTitleArabic;

  const FirstVolChapterModel({
    required this.id,
    required this.chapterTitle,
    required this.chapterTitleArabic,
  });

  factory FirstVolChapterModel.fromMap(Map<String, dynamic> map) {
    return FirstVolChapterModel(
      id: map['id'] as int,
      chapterTitle: map['chapter_title'] as String,
      chapterTitleArabic: map['chapter_title_arabic'] as String,
    );
  }
}
