import 'dart:math';

import 'package:declarative_nav/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    InheritedNavigatorState(
      pagesState: ValueNotifier<ActivePage>(ActivePage.homePage),
      child: const MyApp(),
    ),
  );
}

/// Has a [InheritedNavigatorState] inherited widget above to control the
/// [Navigator] state.
class MyApp extends StatelessWidget {
  /// Creates a [MyApp] widget.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListenableBuilder(
        listenable: context.pagesState,
        builder: (context, _) {
          return Navigator(
            pages: [
              const MaterialPage(
                child: HomePage(),
              ),
              if (context.pagesState.value == ActivePage.randomPage)
                const MaterialPage(
                  child: RandomPage(),
                ),
            ],
            onPopPage: (route, result) {
              if (!route.didPop(result)) {
                return false;
              }

              context.pagesState.value = ActivePage.homePage;
              return true;
            },
          );
        },
      ),
    );
  }
}

/// The application's home page.
class HomePage extends StatelessWidget {
  /// Creates a [HomePage] widget.
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.pagesState.value = ActivePage.randomPage,
          child: const Text('Open random page'),
        ),
      ),
    );
  }
}

/// A page that shows a button with a random number at the center of the screen.
class RandomPage extends StatelessWidget {
  static final _random = Random();

  /// Creates a [RandomPage] widget.
  const RandomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.pagesState.value = ActivePage.homePage,
          child: Text('${_random.nextInt(10)}'),
        ),
      ),
    );
  }
}

/// The error page widget.
class ErrorPage extends StatelessWidget {
  /// Creates a [ErrorPage] widget.
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Error!'),
      ),
    );
  }
}
