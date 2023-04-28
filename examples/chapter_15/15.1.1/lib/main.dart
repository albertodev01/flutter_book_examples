import 'package:flutter/material.dart';
import 'package:localization_demo/l10n/l10n.dart';

void main() {
  runApp(const MyApp());
}

/// The root widget that uses [AppLocalizations] to translate strings.
class MyApp extends StatelessWidget {
  /// Creates a [MyApp] widget.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(
        body: MessageWidget(),
      ),
    );
  }
}

/// Shows a localized message.
class MessageWidget extends StatelessWidget {
  /// Creates a [MessageWidget] widget.
  const MessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(context.l10n.helloWorld),
    );
  }
}
