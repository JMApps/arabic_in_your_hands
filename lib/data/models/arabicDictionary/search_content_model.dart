class SearchContentModel {
  final int docid;
  final int c0articleId;
  final String c1translation;
  final String c2arabic;

  const SearchContentModel({
    required this.docid,
    required this.c0articleId,
    required this.c1translation,
    required this.c2arabic,
  });

  factory SearchContentModel.fromMap(Map<String, dynamic> map) {
    return SearchContentModel(
      docid: map['docid'] as int,
      c0articleId: map['c0article_id'] as int,
      c1translation: map['c1translation'] as String,
      c2arabic: map['c2arabic'] as String,
    );
  }
}
