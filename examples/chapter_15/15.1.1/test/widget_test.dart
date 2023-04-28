import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:localization_demo/l10n/l10n.dart';
import 'package:localization_demo/main.dart';

void main() {
  testWidgets('Smoke test', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: MessageWidget(),
        ),
      ),
    );

    expect(find.text('Hello World!'), findsOneWidget);
  });

  testWidgets('Smoke test for italian locale', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        locale: Locale('it'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: MessageWidget(),
        ),
      ),
    );

    expect(find.text('Ciao mondo!'), findsOneWidget);
  });
}
