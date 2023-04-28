import 'package:flutter/material.dart';

/// The currently visible page.
enum ActivePage {
  /// The home page.
  homePage('/'),

  /// The page that shows a randon number.
  randomPage('/random_page'),

  /// The error page.
  errorPage('/error_page');

  /// The page path.
  final String path;

  /// Creates an [ActivePage] value.
  const ActivePage(this.path);
}

/// Creates an inherited widget that holds a `ValueNotifier<ActivePage>` object.
class InheritedNavigatorState extends InheritedWidget {
  /// A listenable class that holds the value of the currently visible page.
  final ValueNotifier<ActivePage> pagesState;

  /// Creates a [InheritedNavigatorState] inherited widget.
  const InheritedNavigatorState({
    required this.pagesState,
    required super.child,
    super.key,
  });

  /// Retrieves the closest [InheritedNavigatorState] instance up in the tree.
  static InheritedNavigatorState of(BuildContext context) {
    final ref =
        context.dependOnInheritedWidgetOfExactType<InheritedNavigatorState>();
    assert(ref != null, "Couldn't find a InheritedNavigatorState in the tree!");
    return ref!;
  }

  @override
  bool updateShouldNotify(InheritedNavigatorState oldWidget) {
    return pagesState != oldWidget.pagesState;
  }
}

/// Allows using the [InheritedNavigatorState] directly from [BuildContext].
extension InheritedNavigatorStateExt on BuildContext {
  /// The [pagesState] value of [InheritedNavigatorState].
  ValueNotifier<ActivePage> get pagesState =>
      InheritedNavigatorState.of(this).pagesState;
}
