import 'package:flutter/material.dart';

/// Implements "restoration" for [Duration] objects.
class RestorableDuration extends RestorableValue<Duration> {
  @override
  Duration createDefaultValue() => Duration.zero;

  @override
  void didUpdateValue(Duration? oldValue) {
    if (oldValue?.inMicroseconds != value.inMicroseconds) {
      notifyListeners();
    }
  }

  @override
  Duration fromPrimitives(Object? data) {
    if (data != null) {
      return Duration(microseconds: data as int);
    }
    return Duration.zero;
  }

  @override
  Object toPrimitives() => value.inMicroseconds;
}
