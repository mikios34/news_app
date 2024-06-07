import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/screen/widgets/article_card.dart';

/// Usage: The News App displays a list of news articles
Future<void> theNewsAppDisplaysAListOfNewsArticles(WidgetTester tester) async {
  
  expect(find.byType(ArticleCard), findsWidgets);
}
