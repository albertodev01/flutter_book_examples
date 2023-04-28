import 'dart:math';

import 'package:flutter/material.dart';

/// The draggable number at the center.
class CentralNumber extends StatelessWidget {
  static final _value = Random().nextInt(100) + 1;

  /// Creates a [CentralNumber] widget.
  const CentralNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Draggable<int>(
      data: _value,
      feedback: Material(
        child: Container(
          width: 45,
          height: 45,
          color: Colors.black26,
          child: Center(
            child: Text('$_value'),
          ),
        ),
      ),
      child: Text('$_value'),
    );
  }
}
