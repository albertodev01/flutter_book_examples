import 'package:drag_drop/central_number.dart';
import 'package:drag_drop/even_container.dart';
import 'package:drag_drop/odd_container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: DragAndDrop(),
        ),
      ),
    ),
  );
}

/// This widget defines the two numbers containers and the draggable one at the
/// center.
class DragAndDrop extends StatelessWidget {
  /// Creates a [DragAndDrop] widget.
  const DragAndDrop({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        OddContainer(),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 60,
          ),
          child: CentralNumber(),
        ),
        EvenContainer(),
      ],
    );
  }
}
