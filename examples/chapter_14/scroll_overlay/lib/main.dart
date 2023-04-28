import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: HomePage(),
    ),
  );
}

/// Uses [Overlay] and [OverlayEntry] to make a widget float on top of others.
class HomePage extends StatefulWidget {
  /// Creates a [HomePage] widget.
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textKey = GlobalKey();
  final link = LayerLink();

  OverlayEntry? entry;

  void showOverlay() {
    // The key gives access to the RenderObject of the 'Text' widget
    final renderObject = textKey.currentContext?.findRenderObject();

    if (renderObject is RenderBox) {
      // Calculates the position of the 'Text' widget on the screen
      final position = renderObject.globalToLocal(Offset.zero);

      final entry = OverlayEntry(
        builder: (_) {
          return Positioned(
            left: 0,
            right: 0,
            top: position.dy,
            child: CompositedTransformFollower(
              link: link, // This is the 'LayerLink' of the state class
              offset: const Offset(0, 25),
              followerAnchor: Alignment.topCenter,
              targetAnchor: Alignment.topCenter,
              child: Container(
                color: Colors.grey,
                height: 50,
              ),
            ),
          );
        },
      );

      Overlay.of(context).insert(entry);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 800),
          Center(
            child: CompositedTransformTarget(
              link: link,
              child: Text(
                'Hello!',
                key: textKey,
              ),
            ),
          ),
          const SizedBox(height: 800),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showOverlay,
        child: const Icon(Icons.info_outline),
      ),
    );
  }
}
