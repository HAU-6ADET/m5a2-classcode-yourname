// m5a2 - screenshot capture (teacher-canonical, NOT scored).
import 'package:flutter_test/flutter_test.dart';

import 'package:m5a2_catch_monster/catch_screen.dart';

import 'support/haudex_golden.dart';

void main() {
  setUpAll(loadHaudexFonts);

  testWidgets('capture: catch screen', (tester) async {
    await captureScreen(tester, const CatchScreen(), name: 'catch');
  });
}
