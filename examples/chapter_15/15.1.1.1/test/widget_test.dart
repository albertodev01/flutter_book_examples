import 'package:dynamic_locale/l10n/l10n.dart';
import 'package:dynamic_locale/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Smoke test', (tester) async {
    await tester.pumpWidget(
      InheritedLocale(
        locale: ValueNotifier<Locale>(
          InheritedLocale.englishLocale,
        ),
        child: const MyApp(),
      ),
    );

    expect(find.byType(MyApp), findsOneWidget);
    expect(find.text('Toggle locale'), findsOneWidget);
  });

  testWidgets('Change locale', (tester) async {
    await tester.pumpWidget(
      InheritedLocale(
        locale: ValueNotifier<Locale>(
          InheritedLocale.englishLocale,
        ),
        child: const MyApp(),
      ),
    );

    expect(find.text('Hello World!'), findsOneWidget);

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    expect(find.text('Ciao mondo!'), findsOneWidget);
  });
}
