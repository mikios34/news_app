import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:news_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("Theme test -", () {
    testWidgets("Theme Switch test.", (widgetTester) async {
      app.main();

      await widgetTester.pump();
      await widgetTester.idle();
      await widgetTester.pumpAndSettle();

      final popupMenu = find.byIcon(Icons.more_vert);

      await widgetTester.ensureVisible(popupMenu);
      await widgetTester.tap(popupMenu);
      await widgetTester.pumpAndSettle();
      final themeMode = find.text("Dark");

      await widgetTester.ensureVisible(themeMode);
      await widgetTester.tap(themeMode);
      await widgetTester.pumpAndSettle();
      sleep(Duration(seconds: 5));

      await widgetTester.tap(popupMenu);
      await widgetTester.pumpAndSettle();
      final themeMode2 = find.text("Light");

      await widgetTester.ensureVisible(themeMode2);
      await widgetTester.tap(themeMode2);
      await widgetTester.pumpAndSettle();
      sleep(Duration(seconds: 5));

      await widgetTester.tap(popupMenu);
      await widgetTester.pumpAndSettle();
      final themeMode3 = find.text("System");

      await widgetTester.ensureVisible(themeMode3);
      await widgetTester.tap(themeMode3);
      await widgetTester.pumpAndSettle();

      // sleep(Duration(seconds: 10));
    });
  });

  group("News Test", () {
    testWidgets("Search News test", (widgetTester) async {
      app.main();

      await widgetTester.pump();
      await widgetTester.idle();
      await widgetTester.pumpAndSettle();

      final searchField = find.byKey(Key("searchField"));
      await widgetTester.pumpAndSettle();

      await widgetTester.ensureVisible(searchField);
      await widgetTester.pumpAndSettle();

      await widgetTester.tap(searchField);
      await widgetTester.enterText(searchField, "Biden");

      final searchButton = find.byIcon(Icons.search);

      await widgetTester.tap(searchButton.first);
      await widgetTester.pumpAndSettle();

      final articleCard = find.byKey(Key("articleCard0"));
      await widgetTester.ensureVisible(articleCard);
      await widgetTester.pumpAndSettle();

      await widgetTester.tap(articleCard);
      await widgetTester.pumpAndSettle();
      // sleep(Duration(seconds: 10));
      widgetTester.pageBack();
    });
  });
}
