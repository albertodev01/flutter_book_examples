import 'package:custom_painter_image/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Smoke test', (tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Center(
            child: CanvasImage(),
          ),
        ),
      ),
    );

    expect(find.byType(CanvasImage), findsOneWidget);
  });
}
