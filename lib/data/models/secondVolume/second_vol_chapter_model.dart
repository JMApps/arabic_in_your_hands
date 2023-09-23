class SecondVolChapterModel {
  final int id;
  final String chapterTitle;
  final String chapterTitleArabic;

  const SecondVolChapterModel({
    required this.id,
    required this.chapterTitle,
    required this.chapterTitleArabic,
  });

  factory SecondVolChapterModel.fromMap(Map<String, dynamic> map) {
    return SecondVolChapterModel(
      id: map['id'] as int,
      chapterTitle: map['chapter_title'] as String,
      chapterTitleArabic: map['chapter_title_arabic'] as String,
    );
  }
}
