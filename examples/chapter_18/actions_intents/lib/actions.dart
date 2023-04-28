import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// An [Intent] for selecting all text on a widget.
class SelectAllIntent extends Intent {
  /// Creates a [SelectAllIntent] intent.
  const SelectAllIntent();
}

/// An action for the [SelectAllIntent] intent.
class SelectAllAction extends Action<SelectAllIntent> {
  /// The context.
  final BuildContext context;

  /// The selected text.
  final String text;

  /// Creates a [SelectAllAction] action.
  SelectAllAction(this.context, this.text);

  @override
  bool isEnabled(covariant SelectAllIntent intent) => text.isNotEmpty;

  @override
  Future<Object?> invoke(covariant SelectAllIntent intent) async {
    // Copy data to the clipboard so that you can CTRL + V to paste them
    await Clipboard.setData(ClipboardData(text: text));

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Data copied to the clipboard!'),
        ),
      );
    }

    return null;
  }
}
