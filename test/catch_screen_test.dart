// m5a2 - Catch a monster: behaviour checks (canonical overlay).
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:m5a2_catch_monster/catch_screen.dart';

Future<void> pump(WidgetTester tester) async {
  await tester.pumpWidget(const MaterialApp(home: CatchScreen()));
}

int count(WidgetTester tester) {
  final data = tester.widget<Text>(find.byKey(const Key('count'))).data ?? '';
  return int.parse(RegExp(r'\d+').firstMatch(data)?.group(0) ?? '-1');
}

Future<void> catchMonster(WidgetTester tester, String name) async {
  await tester.enterText(find.byType(TextField), name);
  await tester.tap(find.widgetWithText(ElevatedButton, 'Catch'));
  await tester.pump();
}

void main() {
  test('student.json is filled in', () {
    final info = jsonDecode(File('student.json').readAsStringSync())
        as Map<String, dynamic>;
    for (final field in [
      'classCode',
      'fullName',
      'studentNumber',
      'studentEmail',
      'personalEmail',
      'githubAccount',
    ]) {
      expect(info[field], isNotEmpty, reason: 'Set "$field" in student.json');
    }
  });

  group('CatchScreen', () {
    testWidgets('has a TextField and a Catch button, and starts empty',
        (tester) async {
      await pump(tester);
      expect(find.byType(TextField), findsOneWidget);
      expect(find.widgetWithText(ElevatedButton, 'Catch'), findsOneWidget);
      expect(count(tester), 0,
          reason: 'Show the number caught in a Text keyed Key(\'count\').');
    });

    testWidgets('catching a name adds it to the list', (tester) async {
      await pump(tester);
      await catchMonster(tester, 'Pika');
      expect(count(tester), 1);
      expect(find.text('Pika'), findsOneWidget);
    });

    testWidgets('catching two names shows both', (tester) async {
      await pump(tester);
      await catchMonster(tester, 'Pika');
      await catchMonster(tester, 'Char');
      expect(count(tester), 2);
      expect(find.text('Pika'), findsOneWidget);
      expect(find.text('Char'), findsOneWidget);
    });

    testWidgets('an empty name is ignored', (tester) async {
      await pump(tester);
      await catchMonster(tester, '   ');
      expect(count(tester), 0, reason: 'Do not add blank names.');
    });
  });
}
