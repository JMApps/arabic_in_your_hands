class VolumeFirstItemChapterContentModel {
  int? id;
  String? arabicName;
  String? arabicContent;
  String? translationName;
  String? translationContent;
  String? audioName;

  VolumeFirstItemChapterContentModel(
      this.id,
      this.arabicName,
      this.arabicContent,
      this.translationName,
      this.translationContent,
      this.audioName);

  VolumeFirstItemChapterContentModel.fromMap(dynamic object) {
    id = object['_id'];
    arabicName = object['ArabicName'];
    arabicContent = object['ArabicContent'];
    translationName = object['TranslationName'];
    translationContent = object['TranslationContent'];
    audioName = object['AudioName'];
  }
}
