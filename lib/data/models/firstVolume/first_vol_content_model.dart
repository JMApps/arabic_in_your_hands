class FirstVolContentModel {
  final int id;
  final String? arabicName;
  final String arabicContent;
  final String? translationName;
  final String translationContent;
  final String audioName;

  const FirstVolContentModel({
    required this.id,
    required this.arabicName,
    required this.arabicContent,
    required this.translationName,
    required this.translationContent,
    required this.audioName,
  });

  factory FirstVolContentModel.fromMap(Map<String, dynamic> map) {
    return FirstVolContentModel(
      id: map['id'] as int,
      arabicName: map['arabic_name'] as String?,
      arabicContent: map['arabic_content'] as String,
      translationName: map['translation_name'] as String?,
      translationContent: map['translation_content'] as String,
      audioName: map['audio_name'] as String,
    );
  }
}
