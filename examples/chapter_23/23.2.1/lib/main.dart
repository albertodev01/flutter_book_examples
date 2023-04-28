import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:platform_datetime/channels_names.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Center(
          child: PlatformDatetime(),
        ),
      ),
    ),
  );
}

/// This widget uses [MethodChannel] to make platform-specific calls to retrieve
/// the current date and time.
class PlatformDatetime extends StatefulWidget {
  /// Creates a [PlatformDatetime] widget.
  const PlatformDatetime({super.key});

  @override
  State<PlatformDatetime> createState() => _PlatformDatetimeState();
}

class _PlatformDatetimeState extends State<PlatformDatetime> {
  static const channel = MethodChannel(methodChannelDatetime);
  late final future = platformDateTime();

  Future<String> platformDateTime() async {
    const error = "Couldn't get date and time";
    try {
      return await channel.invokeMethod<String>(methodGetDateTime) ?? error;
    } on Exception {
      return error;
    }
  }

  String error = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Date and time on the platform:'),
        const SizedBox(height: 20),
        FutureBuilder<String>(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!);
            }

            return const Text('Loading...');
          },
        ),
      ],
    );
  }
}
