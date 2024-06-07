import 'package:flutter_test/flutter_test.dart';
import 'package:news_app/main.dart' as app;

Future<void> theAppIsRunning(WidgetTester tester) async {
  app.main();

  await tester.pumpAndSettle();
  await tester.idle();
}
