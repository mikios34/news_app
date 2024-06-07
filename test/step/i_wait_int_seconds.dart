import 'package:flutter_test/flutter_test.dart';

/// Usage: I wait {5} int seconds
Future<void> iWaitIntSeconds(WidgetTester tester, int seconds) async {
  await Future.delayed(Duration(seconds: seconds));
}
