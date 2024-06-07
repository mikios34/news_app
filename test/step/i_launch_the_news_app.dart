import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/main.dart' as app;

/// Usage: I launch the News App
Future<void> iLaunchTheNewsApp(WidgetTester tester) async {
  app.main();

  await tester.pumpAndSettle();
  await tester.idle();
}
