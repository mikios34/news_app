import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I should see a detailed view of the selected article
Future<void> iShouldSeeADetailedViewOfTheSelectedArticle(
    WidgetTester tester) async {
  final webView = find.byKey(Key("articleDetail"));
  expect(webView, findsOneWidget);
}
