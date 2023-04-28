import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:route_sharing_iw/main.dart';
import 'package:route_sharing_iw/model/inherited_todo_list.dart';

void main() {
  testWidgets('Smoke test', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(InheritedTodoList), findsOneWidget);
    expect(find.byType(TodoList), findsOneWidget);
    expect(find.byType(ListTile), findsNWidgets(2));
  });

  testWidgets('Can navigate to item', (tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Todo 2'));
    await tester.pumpAndSettle();

    expect(find.text('Todo 2 - Content 2'), findsOneWidget);
  });
}
