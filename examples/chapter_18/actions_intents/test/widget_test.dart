import 'package:actions_intents/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Center(
            child: CenteredText(
              text: 'Hello!',
            ),
          ),
        ),
      ),
    );

    expect(find.byType(CenteredText), findsOneWidget);
    expect(find.text('Hello!'), findsOneWidget);
  });
}
