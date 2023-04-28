import 'package:flutter/material.dart';
import 'package:route_sharing_iw/model/inherited_todo_list.dart';
import 'package:route_sharing_iw/model/todo_list_state.dart';
import 'package:route_sharing_iw/routes.dart';

void main() => runApp(const MyApp());

/// The root widget.
class MyApp extends StatelessWidget {
  /// Creates a [MyApp] widget.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return InheritedTodoList(
      todoListState: TodoListState(),
      child: const MaterialApp(
        initialRoute: todoListRouteName,
        onGenerateRoute: generateRoutes,
        home: TodoList(),
      ),
    );
  }
}

/// Shows a scrollable list of [Todo] items.
class TodoList extends StatelessWidget {
  /// Creates a [TodoList] widget.
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    final todoState = InheritedTodoList.of(context).todoListState;

    return Scaffold(
      body: ListenableBuilder(
        listenable: todoState,
        builder: (context, _) {
          return ListView.builder(
            itemCount: todoState.todos.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(todoState.todos[index].title),
                onTap: () async {
                  todoState.index = index;
                  await Navigator.of(context).pushNamed(todoItemRouteName);
                },
              );
            },
          );
        },
      ),
    );
  }
}

/// Shows the currently selected [Todo] object using [InheritedTodoList].
class TodoItem extends StatelessWidget {
  /// Creates a [TodoItem] widget.
  const TodoItem({super.key});

  @override
  Widget build(BuildContext context) {
    final todoState = InheritedTodoList.of(context).todoListState;

    return Scaffold(
      body: ListenableBuilder(
        listenable: todoState,
        builder: (context, _) {
          final todo = todoState.todos[todoState.index];

          return Text('${todo.title} - ${todo.contents}');
        },
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
