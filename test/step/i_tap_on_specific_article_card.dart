import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: I tap on specific article card
Future<void> iTapOnSpecificArticleCard(WidgetTester tester) async {
  await tester.tap(find.byKey(Key("articleCard1")));
  await tester.pumpAndSettle();
  await Future.delayed(const Duration(seconds: 20));
}
