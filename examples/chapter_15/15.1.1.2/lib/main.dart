import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:manual_locale/l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

/// The main application widget.
class MyApp extends StatelessWidget {
  /// Creates a [MyApp] widget.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.locales,
      home: const Scaffold(
        body: MessageWidget(),
      ),
    );
  }
}

/// Shows a localized message at the center of the screen.
class MessageWidget extends StatelessWidget {
  /// Creates a [MessageWidget] widget.
  const MessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final string = AppLocalizations.of(context).title;

    return Center(
      child: Text(string),
    );
  }
}
