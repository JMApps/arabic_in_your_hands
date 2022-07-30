class VolumeSecondItemChapterContentModel {
  final int id;
  String? arabicName;
  final String arabicContent;
  String? translationName;
  final String translationContent;
  final String audioName;

  VolumeSecondItemChapterContentModel(
      this.id,
      this.arabicName,
      this.arabicContent,
      this.translationName,
      this.translationContent,
      this.audioName);

  VolumeSecondItemChapterContentModel.fromMap(dynamic object)
      : id = object['_id'],
        arabicName = object['ArabicName'],
        arabicContent = object['ArabicContent'],
        translationName = object['TranslationName'],
        translationContent = object['TranslationContent'],
        audioName = object['AudioName'];
}
