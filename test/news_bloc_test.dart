import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/bloc/news/news_bloc.dart';
import 'package:news_app/cubit/theme_cubit.dart';
import 'package:news_app/data/news.dart';
import 'package:news_app/injector.dart';
import 'package:news_app/model/article.dart';
import 'package:news_app/repository/news.dart';

import 'news_dataprovider_test.dart';
import 'news_dataprovider_test.mocks.dart';
import 'package:http/http.dart' as http;

void main() {
  MockClient mockClient = MockClient();
  getIt.registerSingleton<NewsRepository>(
      NewsRepository(NewsDataProvider(httpClient: mockClient)));

  group("News Bloc Success scenario", () {
    blocTest<NewsBloc, NewsState>(
      "Load News. emit NewsLoading() NewsLoadSuccess",
      setUp: () {
        when(mockClient.get(Uri.parse(baseUrl)))
            .thenAnswer((_) async => http.Response(jsonString, 200));
      },
      wait: Duration(seconds: 5),
      build: () => NewsBloc(),
      act: (bloc) => bloc.add(NewsLoad()),
      expect: () =>
          [NewsLoading(), NewsLoadSuccess(articles: articles, isSearch: false)],
    );

    blocTest<NewsBloc, NewsState>(
      "Search News. emit NewsLoading() NewsLoadSuccess",
      setUp: () {
        when(mockClient.get(Uri.parse('$baseUrl&q=biden')))
            .thenAnswer((_) async => http.Response(jsonString, 200));
      },
      wait: Duration(seconds: 5),
      build: () => NewsBloc(),
      act: (bloc) => bloc.add(NewsSearch(queryText: 'biden')),
      expect: () =>
          [NewsLoading(), NewsLoadSuccess(articles: articles, isSearch: true)],
    );
  });

  group("News Bloc Error scenario", () {
    blocTest<NewsBloc, NewsState>(
      "Load News. emit NewsLoading() NewsOperationFailure()",
      setUp: () {
        when(mockClient.get(Uri.parse(baseUrl))).thenAnswer(
            (_) async => http.Response("Interna server error", 500));
      },
      wait: Duration(seconds: 5),
      build: () => NewsBloc(),
      act: (bloc) => bloc.add(NewsLoad()),
      expect: () => [NewsLoading(), NewsOperationFailure()],
    );

    blocTest<NewsBloc, NewsState>(
      "Search News. emit NewsLoading() NewsOperationFailure()",
      setUp: () {
        when(mockClient.get(Uri.parse('$baseUrl&q=biden'))).thenAnswer(
            (_) async => http.Response("Internal server error", 500));
      },
      wait: Duration(seconds: 5),
      build: () => NewsBloc(),
      act: (bloc) => bloc.add(NewsSearch(queryText: 'biden')),
      expect: () => [NewsLoading(), NewsOperationFailure()],
    );
  });
}

final articles = [
  Article(
    source: "Chris Gale",
    title: "What Drives Choosing Flutter Over React Native?",
    sourceUrl:
        "https://readwrite.com/what-drives-choosing-flutter-over-react-native/",
    imageUrl:
        "https://images.readwrite.com/wp-content/uploads/2022/11/Super-hero-3497522.jpg",
    date: "2022-12-09T16:00:37Z",
  )
];
