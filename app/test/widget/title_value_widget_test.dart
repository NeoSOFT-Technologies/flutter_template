// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:app/widget/title_value_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Title value widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: TitleValueWidget(
            title: 'Humidity',
            value: '3.97',
          ),
        ),
      ),
    );

    expect(find.text('Humidity'), findsOneWidget);
    expect(find.text('3.97'), findsOneWidget);
    expect(find.byType(TitleValueWidget), findsOneWidget);
  });
}
