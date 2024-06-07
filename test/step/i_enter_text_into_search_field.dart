import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'i_wait.dart';

/// Usage: I enter {'flutter'} text into search field
Future<void> iEnterTextIntoSearchField(WidgetTester tester, String text) async {
  final searchField = find.byKey(Key("searchField"));
  await tester.enterText(searchField, text);
  await iWait(tester);
}
