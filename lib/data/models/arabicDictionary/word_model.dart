class WordModel {
  final int id;
  final String word;
  final String? shortMeaning;
  final String? meaning;
  final String root;
  final String? plural;
  final String? pluralLetters;
  final String? species;
  final String? other;

  const WordModel({
    required this.id,
    required this.word,
    required this.shortMeaning,
    required this.meaning,
    required this.root,
    required this.plural,
    required this.pluralLetters,
    required this.species,
    required this.other,
  });

  factory WordModel.fromMap(Map<String, dynamic> map) {
    return WordModel(
      id: map['id'] as int,
      word: map['word'] as String,
      shortMeaning: map['short_meaning'] as String?,
      meaning: map['meaning'] as String?,
      root: map['root'] as String,
      plural: map['plural'] as String?,
      pluralLetters: map['plural_letters'] as String?,
      species: map['species'] as String?,
      other: map['other'] as String?,
    );
  }
}
