import 'package:flutter/material.dart';
import 'package:route_sharing_iw/main.dart';
import 'package:route_sharing_iw/model/todo_list_state.dart';

/// Home page.
const todoListRouteName = '/';

/// The route with the details of a specific [Todo] item.
const todoItemRouteName = '/todo_item';

/// Error page.
const errorRouteName = '/error_page';

/// Generates the application routes.
Route<Object?> generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case todoListRouteName:
      return MaterialPageRoute(
        builder: (_) => const TodoList(),
      );
    case todoItemRouteName:
      return MaterialPageRoute(
        builder: (_) => const TodoItem(),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => const ErrorPage(),
      );
  }
}
