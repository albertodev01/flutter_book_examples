import 'dart:ui' as ui;

import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Center(
          child: CanvasImage(),
        ),
      ),
    ),
  );
}

/// Loads a PNG asset into a [CustomPaint] widget.
class CanvasImage extends StatefulWidget {
  /// Creates a [CanvasImage] widget.
  const CanvasImage({super.key});

  @override
  State<CanvasImage> createState() => _CanvasImageState();
}

class _CanvasImageState extends State<CanvasImage> {
  late final uiImageFuture = decodeBackgroundImage();

  Future<ui.Image> decodeBackgroundImage() async {
    final bundle = DefaultAssetBundle.of(context);
    final image = await bundle.load('assets/background.png');
    return decodeImageFromList(image.buffer.asUint8List());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ui.Image>(
      future: uiImageFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          return CustomPaint(
            size: const Size(136, 78),
            painter: MyPainter(image: snapshot.data!),
          );
        }

        return const CircularProgressIndicator();
      },
    );
  }
}

/// A [CustomPainter] that shows an image.
class MyPainter extends CustomPainter {
  /// The image object.
  final ui.Image image;

  /// Creates a [MyPainter] painter object.
  const MyPainter({
    required this.image,
  });

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    canvas.drawImage(image, Offset.zero, Paint());
  }

  @override
  bool shouldRepaint(covariant MyPainter oldDelegate) => false;
}
