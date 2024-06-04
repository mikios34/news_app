// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/model/article.dart';

class NewsDataProvider {
  final http.Client httpClient;
  NewsDataProvider({
    required this.httpClient,
  });

  static const String _apiKey = '92207214a1ac4040a6978e52a0973df1';
  static const String _baseUrl =
      'https://newsapi.org/v2/top-headlines?country=us';

  Future<List<Article>> fetchNewsArticles() async {
    final response = await httpClient.get(Uri.parse('$_baseUrl&apiKey=$_apiKey'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['articles'] as List<dynamic>;
      return data.map((article) => Article.fromJson(article)).toList();
    } else {
      throw Exception('Failed to fetch news articles');
    }
  }

  Future<List<Article>> searchNewsArticles({required String queryText}) async {
    final response =
        await httpClient.get(Uri.parse('$_baseUrl&apiKey=$_apiKey&q=$queryText'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['articles'] as List<dynamic>;
      return data.map((article) => Article.fromJson(article)).toList();
    } else {
      throw Exception('Failed to fetch news articles');
    }
  }
}
