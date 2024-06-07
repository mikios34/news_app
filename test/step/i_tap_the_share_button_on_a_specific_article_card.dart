import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I tap the share button on a specific article card
Future<void> iTapTheShareButtonOnASpecificArticleCard(
    WidgetTester tester) async {
  await tester.tap(find.byIcon(Icons.share).first);
  await tester.pumpAndSettle();
}
