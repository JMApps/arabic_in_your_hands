class VolumeSecondItemChapterModel {
  int? id;
  String? chapterIcon;
  String? chapterTitle;
  String? chapterTitleArabic;

  VolumeSecondItemChapterModel(this.id, this.chapterIcon, this.chapterTitle, this.chapterTitleArabic);

  VolumeSecondItemChapterModel.fromMap(dynamic object) {
    id = object['_id'];
    chapterIcon = object['ChapterIcon'];
    chapterTitle = object['ChapterTitle'];
    chapterTitleArabic = object['ChapterTitleArabic'];
  }
}