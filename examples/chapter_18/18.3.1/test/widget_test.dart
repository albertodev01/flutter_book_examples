import 'package:drag_drop/even_container.dart';
import 'package:drag_drop/main.dart';
import 'package:drag_drop/odd_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Smoke test', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: DragAndDrop(),
          ),
        ),
      ),
    );

    expect(find.byType(DragAndDrop), findsOneWidget);
    expect(find.byType(OddContainer), findsOneWidget);
    expect(find.byType(EvenContainer), findsOneWidget);
  });
}
