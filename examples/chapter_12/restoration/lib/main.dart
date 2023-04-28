import 'package:flutter/material.dart';
import 'package:restoration/restoration_ids.dart';

void main() {
  runApp(
    const MaterialApp(
      restorationScopeId: restorationScopeId,
      home: Scaffold(
        body: Center(
          child: CounterApp(),
        ),
      ),
    ),
  );
}

/// The counter application widget.
class CounterApp extends StatefulWidget {
  /// Creates a [CounterApp] widget.
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> with RestorationMixin {
  /// The [RestorableInt] type is a [ChangeNotifier].
  final counter = RestorableInt(0);

  @override
  String? get restorationId => counterPageRestorationId;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(counter, counterRestorationId);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => setState(() => counter.value++),
      child: Text('${counter.value}'),
    );
  }
}
