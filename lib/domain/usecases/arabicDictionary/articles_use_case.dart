import 'package:arabicinyourhands/domain/entities/arabicDictionary/article_entity.dart';
import 'package:arabicinyourhands/domain/entities/arabicDictionary/search_content_entity.dart';
import 'package:arabicinyourhands/domain/repositories/arabicDictionary/articles_repository.dart';

class ArticlesUseCase {
  final ArticlesRepository _articlesRepository;

  ArticlesUseCase(this._articlesRepository);

  Future<List<ArticleEntity>> fetchAllArticles() async {
    try {
      final List<ArticleEntity> allArticles = await _articlesRepository.getAllArticles();
      return allArticles;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<ArticleEntity> fetchArticlById({required int articleId}) async {
    try {
      final ArticleEntity articleById = await _articlesRepository.getArticleById(articleId: articleId);
      return articleById;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<SearchContentEntry>> fetchSearchWord({required String word}) async {
    try {
      final List<SearchContentEntry> searchWord = await _articlesRepository.searchWord(word: word);
      return searchWord;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<SearchContentEntry>> getTranslationsForArticle({required int articleId}) async {
    try {
      final List<SearchContentEntry> translations = await _articlesRepository.getTranslationsForArticle(articleId: articleId);
      return translations;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}