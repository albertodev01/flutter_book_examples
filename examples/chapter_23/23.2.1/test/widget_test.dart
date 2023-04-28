import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:platform_datetime/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Center(
            child: PlatformDatetime(),
          ),
        ),
      ),
    );

    expect(find.byType(PlatformDatetime), findsOneWidget);
    expect(find.text('Date and time on the platform:'), findsOneWidget);
  });
}
