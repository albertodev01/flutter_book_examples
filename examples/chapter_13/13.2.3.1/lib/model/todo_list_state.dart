import 'package:flutter/material.dart';

/// A to-do item.
final class Todo {
  /// The title.
  final String title;

  /// The contents.
  final String contents;

  /// Creates a [Todo] object.
  const Todo(this.title, this.contents);
}

/// A listenable chass that notifies when the [index] of the current selected
/// item changes.
class TodoListState extends ChangeNotifier {
  /// The list of [Todo] items.
  final todos = List<Todo>.unmodifiable(
    const [
      Todo('Todo 1', 'Content 1'),
      Todo('Todo 2', 'Content 2'),
    ],
  );

  var _index = 0;

  /// The index of the currently selected item in the [todos] list.
  int get index => _index;

  /// Updates the index of the currently selected item.
  set index(int newValue) {
    if (_index != newValue) {
      _index = newValue;
      notifyListeners();
    }
  }
}
