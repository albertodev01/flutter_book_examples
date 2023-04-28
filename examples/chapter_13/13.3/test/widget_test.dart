import 'package:declarative_nav/main.dart';
import 'package:declarative_nav/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Smoke test', (tester) async {
    await tester.pumpWidget(
      InheritedNavigatorState(
        pagesState: ValueNotifier<ActivePage>(ActivePage.homePage),
        child: const MyApp(),
      ),
    );

    expect(find.byType(InheritedNavigatorState), findsOneWidget);
    expect(find.byType(HomePage), findsOneWidget);
    expect(find.byType(RandomPage), findsNothing);
  });

  testWidgets('Changes page', (tester) async {
    await tester.pumpWidget(
      InheritedNavigatorState(
        pagesState: ValueNotifier<ActivePage>(ActivePage.homePage),
        child: const MyApp(),
      ),
    );

    expect(find.byType(HomePage), findsOneWidget);
    expect(find.byType(RandomPage), findsNothing);

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    expect(find.byType(RandomPage), findsOneWidget);
    expect(find.byType(HomePage), findsNothing);
  });
}
