import 'package:flutter/material.dart';

/// Contains a [DragTarget] for even numbers.
class EvenContainer extends StatelessWidget {
  /// Creates a [EvenContainer] widget.
  const EvenContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return DragTarget<int>(
      onAccept: (data) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Even number accepted: $data'),
          ),
        );
      },
      onWillAccept: (data) => data?.isEven ?? false,
      builder: (context, _, __) {
        return Container(
          width: 50,
          height: 50,
          color: Colors.lightGreen,
          child: const Center(
            child: Text('Even'),
          ),
        );
      },
    );
  }
}
