import 'package:flutter/material.dart';
import 'package:localization_demo/l10n/l10n.dart';

export 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Extension method on [BuildContext] that allows getting a reference to the
/// [AppLocalizations] instance.
extension AppLocalizationsExt on BuildContext {
  /// Returns an [AppLocalizations] instance associated to the current context.
  AppLocalizations get l10n => AppLocalizations.of(this);
}
