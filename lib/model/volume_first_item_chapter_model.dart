class VolumeFirstItemChapterModel {
  int? id;
  String? chapterIcon;
  String? chapterTitle;
  String? chapterTitleArabic;

  VolumeFirstItemChapterModel(this.id, this.chapterIcon, this.chapterTitle, this.chapterTitleArabic);

  VolumeFirstItemChapterModel.fromMap(dynamic object) {
    id = object['_id'];
    chapterIcon = object['ChapterIcon'];
    chapterTitle = object['ChapterTitle'];
    chapterTitleArabic = object['ChapterTitleArabic'];
  }
}