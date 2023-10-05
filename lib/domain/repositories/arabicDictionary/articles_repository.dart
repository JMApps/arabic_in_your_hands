import 'package:arabicinyourhands/domain/entities/arabicDictionary/article_entity.dart';
import 'package:arabicinyourhands/domain/entities/arabicDictionary/search_content_entity.dart';

abstract class ArticlesRepository {
  Future<List<ArticleEntity>> getAllArticles();

  Future<ArticleEntity> getArticleById({required int articleId});

  Future<List<SearchContentEntry>> searchWord({required String word});

  Future<List<SearchContentEntry>> getTranslationsForArticle({required int articleId});
}