import 'package:flutter_test/flutter_test.dart';

import 'the_app_is_running.dart';
import 'the_news_app_displays_a_list_of_news_articles.dart';

/// Usage: List of news articles is displayed
Future<void> listOfNewsArticlesIsDisplayed(WidgetTester tester) async {
  await theAppIsRunning(tester);
  await Future.delayed(const Duration(seconds: 5));
  theNewsAppDisplaysAListOfNewsArticles(tester);
}
