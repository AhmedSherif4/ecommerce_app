import 'package:flutter/foundation.dart';

extension LogExtension<T> on T {
  void log() {
    if (kDebugMode) {
      print(
        '---------------------\n${toString()}\n-----------------------------',
      );
    }
  }
}
