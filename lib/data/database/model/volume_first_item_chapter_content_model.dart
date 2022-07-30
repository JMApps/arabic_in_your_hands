class VolumeFirstItemChapterContentModel {
  final int id;
  String? arabicName;
  final String arabicContent;
  String? translationName;
  final String translationContent;
  final String audioName;

  VolumeFirstItemChapterContentModel(
      this.id,
      this.arabicName,
      this.arabicContent,
      this.translationName,
      this.translationContent,
      this.audioName);

  VolumeFirstItemChapterContentModel.fromMap(dynamic object)
      : id = object['_id'],
        arabicName = object['ArabicName'],
        arabicContent = object['ArabicContent'],
        translationName = object['TranslationName'],
        translationContent = object['TranslationContent'],
        audioName = object['AudioName'];
}
