import 'package:flutter_test/flutter_test.dart';

import 'i_wait_int_seconds.dart';

/// Usage: the app should provide sharing options
Future<void> theAppShouldProvideSharingOptions(WidgetTester tester) async {
  await iWaitIntSeconds(tester, 5);
}
