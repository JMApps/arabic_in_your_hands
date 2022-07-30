class VolumeFirstItemChapterModel {
  final int id;
  final String chapterIcon;
  final String chapterTitle;
  final String chapterTitleArabic;

  VolumeFirstItemChapterModel(
      this.id, this.chapterIcon, this.chapterTitle, this.chapterTitleArabic);

  VolumeFirstItemChapterModel.fromMap(dynamic object)
      : id = object['_id'],
        chapterIcon = object['ChapterIcon'],
        chapterTitle = object['ChapterTitle'],
        chapterTitleArabic = object['ChapterTitleArabic'];
}
