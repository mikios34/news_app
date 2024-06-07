import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// Usage: circular progress indicator is displayed initially
Future<void> circularProgressIndicatorIsDisplayedInitially(
    WidgetTester tester) async {
  expect(find.byType(CircularProgressIndicator), isNotNull);
}
