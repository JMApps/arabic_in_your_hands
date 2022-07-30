class VolumeSecondItemChapterModel {
  final int id;
  final String chapterIcon;
  final String chapterTitle;
  final String chapterTitleArabic;

  VolumeSecondItemChapterModel(
      this.id, this.chapterIcon, this.chapterTitle, this.chapterTitleArabic);

  VolumeSecondItemChapterModel.fromMap(dynamic object)
      : id = object['_id'],
        chapterIcon = object['ChapterIcon'],
        chapterTitle = object['ChapterTitle'],
        chapterTitleArabic = object['ChapterTitleArabic'];
}
