import 'package:deep_link/main.dart';
import 'package:deep_link/router_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: const MyRouteInformationParser(),
      routerDelegate: MyRouterDelegate(),
    );
  }
}

void main() {
  testWidgets('Smoke test', (tester) async {
    await tester.pumpWidget(const TestApp());

    expect(find.byType(HomePage), findsOneWidget);
    expect(find.text('Open random page'), findsOneWidget);
  });

  testWidgets('Changes page', (tester) async {
    await tester.pumpWidget(const TestApp());
    expect(find.byType(HomePage), findsOneWidget);

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    expect(find.byType(HomePage), findsNothing);
    expect(find.byType(RandomPage), findsOneWidget);
  });
}
