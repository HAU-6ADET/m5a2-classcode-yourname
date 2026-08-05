// m5a2 - screenshot capture (teacher-canonical, NOT scored).
//
// An empty form is the least interesting state of this screen, so we type into
// it: one caught monster, then several, which is where the list layout and the
// counter actually show.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:m5a2_catch_monster/catch_screen.dart';

import 'support/haudex_golden.dart';

Future<void> _catch(WidgetTester tester, String name) async {
  await tester.enterText(find.byType(TextField), name);
  await tester.tap(find.widgetWithText(ElevatedButton, 'Catch'));
  await tester.pump();
}

void main() {
  setUpAll(loadHaudexFonts);

  testWidgets('capture: catch flow', (tester) async {
    await pumpHaudex(tester, const CatchScreen());
    await shoot(tester, '01-empty');

    await step(tester, '02-one-caught', () async {
      await _catch(tester, 'Emberling');
    });

    await step(tester, '03-several-caught', () async {
      await _catch(tester, 'Aquaphin');
      await _catch(tester, 'Sprout');
      await _catch(tester, 'Cinderpup');
    });
  });
}
