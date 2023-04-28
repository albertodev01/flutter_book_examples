/// The routes defined by the application.
enum AppRoutePath {
  /// The home page.
  home('/'),

  /// The random page.
  random('/random'),

  /// The error page.
  error('/error');

  /// The route path.
  final String path;

  /// Creates a [AppRoutePath] value.
  const AppRoutePath(this.path);

  /// Whether the [home] value is selected or not.
  bool get isHomePage => index == 0;

  /// Whether the [random] value is selected or not.
  bool get isRandomPage => index == 1;

  /// Whether the [error] value is selected or not.
  bool get isError => index == 2;
}
