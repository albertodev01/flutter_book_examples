import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Localizes strings in various languages.
class AppLocalizations {
  /// The [Locale] object.
  final Locale locale;

  /// Creates an [AppLocalizations] object.
  const AppLocalizations(this.locale);

  /// Returns the localized resources object of [AppLocalizations] type using
  /// the [context].
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const _localizedValues = <String, Map<String, String>>{
    'en': {
      'title': 'Hello world!',
    },
    'it': {
      'title': 'Ciao mondo!',
    },
  };

  /// Supported languages.
  static final languages = _localizedValues.keys.toList(
    growable: false,
  );

  /// Supported locales.
  static final locales = _localizedValues.keys.map(Locale.new).toList(
        growable: false,
      );

  /// Localizes the application title.
  String get title => _localizedValues[locale.languageCode]!['title']!;
}

/// The delegate class associated to [AppLocalizations].
class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  /// Creates a [AppLocalizationsDelegate] object.
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      AppLocalizations.languages.contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
