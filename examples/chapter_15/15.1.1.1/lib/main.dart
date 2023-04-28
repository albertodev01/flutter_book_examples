import 'package:dynamic_locale/l10n/l10n.dart';
import 'package:flutter/material.dart';

void main() {
  final initialLocale = ValueNotifier<Locale>(InheritedLocale.englishLocale);

  runApp(
    InheritedLocale(
      locale: initialLocale,
      child: const MyApp(),
    ),
  );
}

/// The main application widget.
class MyApp extends StatelessWidget {
  /// Creates a [MyApp] widget.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: context.locale,
      builder: (context, child) {
        return MaterialApp(
          locale: context.locale.value,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: child,
        );
      },
      child: const HomeWidget(),
    );
  }
}

/// The home page widget.
class HomeWidget extends StatelessWidget {
  /// Creates a [HomeWidget] widget.
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(context.l10n.helloWorld),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                if (context.locale.value == InheritedLocale.englishLocale) {
                  context.locale.value = InheritedLocale.italianLocale;
                } else {
                  context.locale.value = InheritedLocale.englishLocale;
                }
              },
              child: const Text('Toggle locale'),
            ),
          ],
        ),
      ),
    );
  }
}
