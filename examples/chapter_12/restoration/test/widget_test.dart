import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:restoration/main.dart';
import 'package:restoration/restoration_ids.dart';

void main() {
  testWidgets('Test for restoration', (tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        restorationScopeId: restorationScopeId,
        home: Scaffold(
          body: Center(
            child: CounterApp(),
          ),
        ),
      ),
    );

    final buttonFinder = find.byType(ElevatedButton);

    // Increase value to 2
    await tester.tap(buttonFinder);
    await tester.tap(buttonFinder);
    await tester.pump();

    expect(find.text('2'), findsOneWidget);

    // Simulates state restoration
    await tester.restartAndRestore();

    // Increase value and check it is 3
    await tester.tap(buttonFinder);
    await tester.pump();

    expect(find.text('3'), findsOneWidget);
  });
}
