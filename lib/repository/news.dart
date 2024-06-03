import 'package:news_app/data/news.dart';
import 'package:news_app/model/article.dart';

class NewsRepository {
  final NewsDataProvider _newsDataProvider;

  NewsRepository(this._newsDataProvider);

  Future<List<Article>> getNewsArticles() {
    return _newsDataProvider.fetchNewsArticles();
  }
}