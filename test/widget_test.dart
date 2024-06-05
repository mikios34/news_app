// Mock classes for the blocs
import 'dart:math';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:news_app/bloc/news/news_bloc.dart';
import 'package:news_app/cubit/theme_cubit.dart';
import 'package:news_app/screen/home_page.dart';
import 'package:news_app/screen/widgets/article_card.dart';
import 'package:news_app/theme.dart';

import 'news_bloc_test.dart';

class MockNewsBloc extends MockBloc<NewsEvent, NewsState> implements NewsBloc {}

class MockThemeCubit extends MockCubit<ThemeState> implements ThemeCubit {}

void main() {
  group('HomePage Widget Test', () {
    late MockNewsBloc mockNewsBloc;
    late MockThemeCubit mockThemeCubit;

    setUp(() {
      mockNewsBloc = MockNewsBloc();
      mockThemeCubit = MockThemeCubit();

      whenListen<NewsState>(
        mockNewsBloc,
        Stream<NewsState>.fromIterable([NewsLoading()]),
        initialState: NewsLoading(),
      );

      whenListen<ThemeState>(
        mockThemeCubit,
        Stream<ThemeState>.fromIterable([ThemeState(ThemeMode.system)]),
        initialState: ThemeState(ThemeMode.system),
      );
    });

    Widget createWidgetUnderTest() {
      return MultiBlocProvider(
        providers: [
          BlocProvider<NewsBloc>(
            create: (context) => mockNewsBloc,
          ),
          BlocProvider<ThemeCubit>(
            create: (context) => mockThemeCubit,
          ),
        ],
        child: MaterialApp(
          theme: lightTheme,
          darkTheme: darkTheme,
          home: HomePage(),
        ),
      );
    }

    testWidgets('renders HomePage with initial state',
        (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text("News Demo "), findsOneWidget);
      expect(find.byType(TextFormField), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets(
        'displays list of articles when NewsLoadSuccess state is emitted',
        (WidgetTester tester) async {
      whenListen<NewsState>(
        mockNewsBloc,
        Stream<NewsState>.fromIterable(
            [NewsLoadSuccess(articles: articles, isSearch: false)]),
        initialState: NewsLoadSuccess(articles: articles, isSearch: false),
      );
      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(ArticleCard), findsNWidgets(1));
      expect(find.text('Chris Gale'), findsOneWidget);
    });

    testWidgets(
        'displays error message when NewsOperationFailure state is emitted',
        (WidgetTester tester) async {
      whenListen<NewsState>(
        mockNewsBloc,
        Stream<NewsState>.fromIterable([NewsOperationFailure()]),
        initialState: NewsOperationFailure(),
      );

      await tester.pumpWidget(createWidgetUnderTest());
      await tester.pump();

      expect(find.text('News Load Operation Failure.'), findsOneWidget);
    });

    testWidgets('toggles theme mode when selected from PopupMenuButton',
        (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byIcon(Icons.more_vert), findsOneWidget);
      await tester.tap(find.byIcon(Icons.more_vert));
    });

    testWidgets('searches news when search icon is pressed',
        (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      await tester.enterText(find.byType(TextFormField), 'flutter');
      await tester.tap(find.byIcon(Icons.search));
      await tester.pump();
    });
  });
}
