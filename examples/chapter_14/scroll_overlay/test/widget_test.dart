import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scroll_overlay/main.dart';

void main() {
  testWidgets('Smoke test', (tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(),
      ),
    );

    await tester.scrollUntilVisible(
      find.byType(CompositedTransformTarget),
      200,
    );

    expect(find.byType(CompositedTransformTarget), findsOneWidget);
    expect(find.byType(CompositedTransformFollower), findsNothing);
  });

  testWidgets('Overlay can be opened', (tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(),
      ),
    );

    await tester.scrollUntilVisible(
      find.byType(CompositedTransformTarget),
      200,
    );

    expect(find.byType(CompositedTransformFollower), findsNothing);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    expect(find.byType(CompositedTransformFollower), findsOneWidget);
  });
}
