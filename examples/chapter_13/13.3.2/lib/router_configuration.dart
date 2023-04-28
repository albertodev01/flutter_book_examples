import 'package:deep_link/main.dart';
import 'package:deep_link/routes.dart';
import 'package:flutter/material.dart';

/// The information parser class.
class MyRouteInformationParser extends RouteInformationParser<AppRoutePath> {
  /// Creates a [MyRouteInformationParser] object.
  const MyRouteInformationParser();

  @override
  Future<AppRoutePath> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    final uri = Uri.tryParse(routeInformation.location ?? '');

    if (uri != null) {
      if (uri.path == AppRoutePath.home.path) {
        return AppRoutePath.home;
      }

      if (uri.path == AppRoutePath.random.path) {
        return AppRoutePath.random;
      }
    }

    return AppRoutePath.error;
  }

  @override
  RouteInformation? restoreRouteInformation(AppRoutePath configuration) {
    if (configuration.isError) {
      return RouteInformation(location: AppRoutePath.error.path);
    }

    if (configuration.isHomePage) {
      return RouteInformation(location: AppRoutePath.home.path);
    }

    if (configuration.isRandomPage) {
      return RouteInformation(location: AppRoutePath.random.path);
    }

    return null;
  }
}

/// A router delegate that holds the [Navigator] state.
class MyRouterDelegate extends RouterDelegate<AppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoutePath> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  var _isError = false;
  var _isHome = true;

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  AppRoutePath get currentConfiguration {
    if (_isError) {
      return AppRoutePath.error;
    }

    if (_isHome) {
      return AppRoutePath.home;
    }

    return AppRoutePath.random;
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _navigatorKey,
      pages: [
        MaterialPage(
          key: const ValueKey('HomePage'),
          child: HomePage(
            openRandomPage: () {
              _isHome = false;
              _isError = false;
              notifyListeners();
            },
          ),
        ),
        if (_isError)
          const MaterialPage(
            key: ValueKey('ErrorPage'),
            child: ErrorPage(),
          ),
        if (!_isHome)
          MaterialPage(
            key: const ValueKey('RandomPage'),
            child: RandomPage(
              openHomePage: () {
                _isHome = true;
                _isError = false;
                notifyListeners();
              },
            ),
          ),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        _isError = false;
        _isHome = true;
        notifyListeners();

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(AppRoutePath configuration) async {
    if (configuration.isError) {
      _isError = true;
    } else if (configuration.isHomePage) {
      _isError = false;
      _isHome = true;
    } else {
      _isError = false;
      _isHome = false;
    }
  }
}
