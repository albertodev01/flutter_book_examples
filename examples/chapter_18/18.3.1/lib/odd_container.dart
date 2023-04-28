import 'package:flutter/material.dart';

/// Contains a [DragTarget] for even numbers.
class OddContainer extends StatelessWidget {
  /// Creates a [OddContainer] widget.
  const OddContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return DragTarget<int>(
      onAccept: (data) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Odd number accepted: $data'),
          ),
        );
      },
      onWillAccept: (data) => data?.isOdd ?? false,
      builder: (context, _, __) {
        return Container(
          width: 50,
          height: 50,
          color: Colors.blue,
          child: const Center(
            child: Text('Odd'),
          ),
        );
      },
    );
  }
}
