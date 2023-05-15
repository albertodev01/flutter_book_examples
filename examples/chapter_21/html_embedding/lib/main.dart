import 'package:flutter/material.dart';
import 'package:js/js.dart';
import 'package:js/js_util.dart' as js_util;

void main() {
  runApp(const CounterApp());
}

/// The root widget. It contains a button that increases a counter.
class CounterApp extends StatelessWidget {
  /// Creates a [CounterApp] widget.
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: CounterBody(),
        ),
      ),
    );
  }
}

/// The tappable button at the center of the [CounterApp] widget..
class CounterBody extends StatefulWidget {
  /// Creates a [CounterBody] widget.
  const CounterBody({super.key});

  @override
  State<CounterBody> createState() => _CounterBodyState();
}

@JSExport()
class _CounterBodyState extends State<CounterBody> {
  int _counter = 0;

  @JSExport()
  void increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    // Binds a Dart object that has the 'JSExport' annotation to a JavaScript
    // object.
    final export = js_util.createDartExport(this);

    // Holds the 'State' object
    js_util.setProperty(js_util.globalThis, '_counterState', export);

    // Creates a function with no parameters on the JS side
    js_util.callMethod<void>(js_util.globalThis, '_countChanger', []);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: increment,
      child: Text('$_counter'),
    );
  }
}
