class WordEntity {
  final int id;
  final String word;
  final String? shortMeaning;
  final String? meaning;
  final String root;
  final String? plural;
  final String? pluralLetters;
  final String? species;
  final String? other;

  const WordEntity({
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
}
