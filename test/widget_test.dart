// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:calculator3/Homepage.dart';

void main() {
  testWidgets('test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(new MyApp());

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
    expect(find.text('3'), findsOneWidget);
    expect(find.text('4'), findsOneWidget);
    expect(find.text('5'), findsOneWidget);
    expect(find.text('6'), findsOneWidget);
    expect(find.text('7'), findsOneWidget);
    expect(find.text('8'), findsOneWidget);
    expect(find.text('9'), findsOneWidget);
    expect(find.text('+'), findsOneWidget);
    expect(find.text('x'), findsOneWidget);
    expect(find.text('-'), findsOneWidget);
    expect(find.text('/'), findsOneWidget);
    expect(find.text('.'), findsOneWidget);
    expect(find.text('mr'), findsOneWidget);
    expect(find.text('mc'), findsOneWidget);
    expect(find.text('m+'), findsOneWidget);
    expect(find.text('C'), findsOneWidget);

    await tester.tap(find.text("1"));
    await tester.tap(find.text("x"));
    await tester.tap(find.text("2"));
    await tester.tap(find.text("."));
    await tester.tap(find.text("5"));
    await tester.tap(find.text("="));
    await tester.pump();
    expect(find.text('2.5'), findsOneWidget);

    await tester.tap(find.text("C"));
    await tester.pump();
    expect(find.text(''), findsOneWidget);

    await tester.tap(find.text("5"));
    await tester.tap(find.text("/"));
    await tester.tap(find.text("2"));
    await tester.tap(find.text("."));
    await tester.tap(find.text("5"));
    await tester.tap(find.text("="));
    await tester.pump();
    expect(find.text('2'), findsOneWidget);

    await tester.tap(find.text("6"));
    await tester.tap(find.text("m+"));
    await tester.tap(find.text("C"));
    await tester.tap(find.text("mr"));
    await tester.pump();
    expect(find.text('6'), findsOneWidget);


  });
}
