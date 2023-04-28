import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_form/main.dart';

void main() {
  testWidgets('Smoke test', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(LoginForm), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.byType(Form), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets('Try to validate the form', (tester) async {
    await tester.pumpWidget(const MyApp());

    // Invalid
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    expect(find.byType(SnackBar), findsNothing);

    // Enter text
    await tester.enterText(find.byType(TextFormField).first, 'abc@gmail.com');
    await tester.enterText(find.byType(TextFormField).last, 'abc123456');
    await tester.tap(find.byType(ElevatedButton));

    await tester.pumpAndSettle();

    expect(find.byType(SnackBar), findsOneWidget);
  });
}
