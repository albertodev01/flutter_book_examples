import 'package:dynamic_locale/l10n/l10n.dart';
import 'package:flutter/material.dart';

export 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// An [InheritedWidget] that exposes a [ValueNotifier] object.
class InheritedLocale extends InheritedWidget {
  /// Default value for the "English" locale.
  static const englishLocale = Locale('en');

  /// Default value for the "Italian" locale.
  static const italianLocale = Locale('it');

  /// The current app's [Locale].
  final ValueNotifier<Locale> locale;

  /// Creates an [InheritedLocale] inherited widget.
  const InheritedLocale({
    required super.child,
    required this.locale,
    super.key,
  });

  /// Retrieves the closest [InheritedLocale] instance up in the tree.
  static InheritedLocale of(BuildContext context) {
    final ref = context.dependOnInheritedWidgetOfExactType<InheritedLocale>();
    assert(ref != null, "No 'InheritedLocale' found above in the tree.");

    return ref!;
  }

  @override
  bool updateShouldNotify(covariant InheritedLocale oldWidget) {
    return locale != oldWidget.locale;
  }
}

/// Extension method on [BuildContext] that allows getting a reference to the
/// [ValueNotifier] up in the tree using [InheritedLocaleExt].
extension InheritedLocaleExt on BuildContext {
  /// The listenable [Locale] object exposed by [InheritedLocale].
  ValueNotifier<Locale> get locale => InheritedLocale.of(this).locale;
}

/// Extension method on [BuildContext] that allows getting a reference to the
/// [AppLocalizations] instance.
extension AppLocalizationsExt on BuildContext {
  /// Returns an [AppLocalizations] instance associated to the current context.
  AppLocalizations get l10n => AppLocalizations.of(this);
}
