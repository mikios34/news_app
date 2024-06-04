import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:news_app/data/news.dart';
import 'package:news_app/model/article.dart';

import 'news_dataprovider_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late MockClient client;
  late NewsDataProvider newsDataProvider;


  group("Fetch News", () {
    client = MockClient();
    newsDataProvider = NewsDataProvider(httpClient: client);

    test(
      "Should return a list of articles with success when status code is 200",
      () async {
        when(client.get(Uri.parse(baseUrl)))
            .thenAnswer((_) async => http.Response(jsonString, 200));
        final result = await newsDataProvider.fetchNewsArticles();
        expect(result, isA<List<Article>>());
      },
    );

    test('throws an exception if the http call completes with an error',
        () async {
      when(client.get(Uri.parse(baseUrl))).thenAnswer(
          (_) async => http.Response('Failed to fetch news articles', 404));

      expect(newsDataProvider.fetchNewsArticles(), throwsException);
    });
  });

  group("Search News", () {
    test(
      "Should return a list of articles with success when status code is 200",
      () async {
        when(client.get(Uri.parse('$baseUrl&q=biden')))
            .thenAnswer((_) async => http.Response(jsonString, 200));
        final result =
            await newsDataProvider.searchNewsArticles(queryText: 'biden');
        expect(result, isA<List<Article>>());
      },
    );

    test('throws an exception if the http call completes with an error',
        () async {
      when(client.get(Uri.parse('$baseUrl&q=biden'))).thenAnswer(
          (_) async => http.Response('Failed to fetch news articles', 404));

      expect(newsDataProvider.searchNewsArticles(queryText: "biden"),
          throwsException);
    });
  });
}

const String baseUrl =
    'https://newsapi.org/v2/top-headlines?country=us&apiKey=92207214a1ac4040a6978e52a0973df1';
const jsonString = """
  {
 "status": "ok",
 "totalResults": 484,
 "articles": [{
  "source": {
   "id": null,
   "name": "ReadWrite"
  },
  "author": "Chris Gale",
  "title": "What Drives Choosing Flutter Over React Native?",
  "description": "For those looking at open-source options",
  "url": "https://readwrite.com/what-drives-choosing-flutter-over-react-native/",
  "urlToImage": "https://images.readwrite.com/wp-content/uploads/2022/11/Super-hero-3497522.jpg",
  "publishedAt": "2022-12-09T16:00:37Z",
  "content": "For those looking at open-source options for applications"
 }]
}
  """;
