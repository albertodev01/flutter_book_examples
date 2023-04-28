import 'package:actions_intents/actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Center(
          child: CenteredText(
            text: 'Hello!',
          ),
        ),
      ),
    ),
  );
}

/// Shows a [Text] widget at the center of the screen. It interact with keyboard
/// keys combinations.
class CenteredText extends StatefulWidget {
  /// The text.
  final String text;

  /// Creates a [CenteredText] widget.
  const CenteredText({
    required this.text,
    super.key,
  });

  @override
  State<CenteredText> createState() => _CenteredTextState();
}

class _CenteredTextState extends State<CenteredText> {
  Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(
          LogicalKeyboardKey.control,
          LogicalKeyboardKey.keyC,
        ): const SelectAllIntent(),
      },
      child: Actions(
        actions: <Type, Action<Intent>>{
          SelectAllIntent: SelectAllAction(context, widget.text),
        },
        child: Focus(
          onFocusChange: (hasFocus) {
            setState(() => hasFocus ? bgColor = Colors.black12 : null);
          },
          child: Container(
            width: 50,
            height: 50,
            color: bgColor,
            child: Center(
              child: Text(widget.text),
            ),
          ),
        ),
      ),
    );
  }
}
