import 'package:flutter/material.dart';
import 'package:route_sharing_iw/model/todo_list_state.dart';

/// Creates a inherited widget that exposes a [TodoListState] object.
class InheritedTodoList extends InheritedWidget {
  /// The state class.
  final TodoListState todoListState;

  /// Creates a [InheritedTodoList] inherited widget.
  const InheritedTodoList({
    required this.todoListState,
    required super.child,
    super.key,
  });

  /// Retrieves the closest [InheritedTodoList] instance up in the tree.
  static InheritedTodoList of(BuildContext context) {
    final ref = context.dependOnInheritedWidgetOfExactType<InheritedTodoList>();
    assert(ref != null, "Couldn't find 'InheritedTodoList' above in the tree!");
    return ref!;
  }

  @override
  bool updateShouldNotify(covariant InheritedTodoList oldWidget) {
    return todoListState != oldWidget.todoListState;
  }
}
