import 'package:flutter_test/flutter_test.dart';

/// Usage: I should see the article with the text {"flutter"} text
Future<void> iShouldSeeTheArticleWithTheTextText(
    WidgetTester tester, String param1) async {
  await Future.delayed(const Duration(seconds: 10));
  final articleCard = find.text(param1);
  await Future.delayed(const Duration(seconds: 10));
  expect(articleCard, findsOneWidget);
}
