import 'dart:math';

import 'package:deep_link/router_configuration.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp.router(
      routeInformationParser: const MyRouteInformationParser(),
      routerDelegate: MyRouterDelegate(),
    ),
  );
}

/// The home page widget.
class HomePage extends StatelessWidget {
  /// This callback is used to navigate to the random page.
  final VoidCallback openRandomPage;

  /// Creates a [HomePage] widget.
  const HomePage({
    required this.openRandomPage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: openRandomPage,
          child: const Text('Open random page'),
        ),
      ),
    );
  }
}

/// The random page.
class RandomPage extends StatelessWidget {
  static final _random = Random();

  /// This callback is used to navigate back to the home page.
  final VoidCallback openHomePage;

  /// Creates a [RandomPage] widget.
  const RandomPage({
    required this.openHomePage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: openHomePage,
          child: Text('${_random.nextInt(10)}'),
        ),
      ),
    );
  }
}

/// The error page.
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
