import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:news_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("Theme test -", () {
    testWidgets("Theme Switch test.", (tester) async {
      app.main();

      await tester.pumpAndSettle();
      await tester.idle();

      final popupMenu = find.byIcon(Icons.more_vert);
      expect(popupMenu, findsOneWidget);

      await tester.tap(popupMenu);
      await tester.pumpAndSettle();
      final themeMode = find.text("Dark");
      expect(themeMode, findsOneWidget);

      await tester.tap(themeMode);
      await tester.pumpAndSettle();
      await Future.delayed(Duration(seconds: 5));

      await tester.tap(popupMenu);
      await tester.pumpAndSettle();
      final themeMode2 = find.text("Light");
      expect(themeMode2, findsOneWidget);

      await tester.tap(themeMode2);
      await tester.pumpAndSettle();
      await Future.delayed(Duration(seconds: 5));

      await tester.tap(popupMenu);
      await tester.pumpAndSettle();
      final themeMode3 = find.text("System");
      expect(themeMode3, findsOneWidget);

      await tester.tap(themeMode3);
      await tester.pumpAndSettle();
      await Future.delayed(Duration(seconds: 5));
    });
  });
  group("News Test", () {
    testWidgets("Test article detail page and article share.", (tester) async {
      app.main();

      await tester.pumpAndSettle();
      await tester.idle();

      final shareIcon = find.byIcon(Icons.share);
      expect(shareIcon, findsWidgets);

      await tester.tap(shareIcon.first);
      await tester.pumpAndSettle();
      await Future.delayed(Duration(seconds: 5));

      final articleCard = find.byKey(Key("articleCard0"));
      expect(articleCard, findsOneWidget);

      await tester.tap(articleCard);
      await tester.pumpAndSettle();

      await Future.delayed(Duration(seconds: 25));
      final webView = find.byKey(Key("articleDetail"));
      expect(webView, findsOneWidget);
    });

    testWidgets("Search News test", (tester) async {
      app.main();

      await tester.pumpAndSettle();
      await tester.idle();

      final searchField = find.byKey(Key('searchField'));
      expect(searchField, findsOneWidget);

      await tester.ensureVisible(searchField);
      await tester.pumpAndSettle();

      await tester.tap(searchField);
      await tester.enterText(searchField, 'Biden');
      await tester.pumpAndSettle();

      final searchButton = find.byIcon(Icons.search);
      await tester.tap(searchButton.first);
      await tester.pumpAndSettle();

      // Wait for a few seconds to simulate the search
      await Future.delayed(Duration(seconds: 5));

      final articleCard = find.byKey(Key("articleCard0"));
      expect(articleCard, findsOneWidget);

      await tester.tap(articleCard);
      await tester.pumpAndSettle();

      await Future.delayed(Duration(seconds: 25));

      final webView = find.byKey(Key("articleDetail"));
      expect(webView, findsOneWidget);

      final backButton = find.byIcon(Icons.arrow_back_ios_new);
      expect(backButton, findsOneWidget);
      await tester.tap(backButton);
      await tester.pumpAndSettle();

      final clearIcon = find.byIcon(Icons.clear_all);
      await tester.tap(clearIcon);
      await tester.pumpAndSettle();

      await Future.delayed(Duration(seconds: 10));

      // Expect news loaded after search is cleared
      expect(articleCard, findsOneWidget);
    });
  });
}
