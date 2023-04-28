import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:manual_locale/l10n/app_localizations.dart';
import 'package:manual_locale/main.dart';

void main() {
  testWidgets('Smoke test', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(MyApp), findsOneWidget);
    expect(find.byType(MessageWidget), findsOneWidget);
    expect(find.text('Hello world!'), findsOneWidget);

    final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));

    expect(materialApp.supportedLocales, equals(AppLocalizations.locales));
    expect(
      materialApp.localizationsDelegates,
      equals(
        const [
          AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
      ),
    );
  });
}
