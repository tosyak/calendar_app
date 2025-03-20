import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

mixin AppLogger {
  Logger get log => Logger('$runtimeType');
}

void initializeLogger({String? prefix}) {
  Logger.root.level = Level.ALL;

  const separator = ' | ';
  const horizontalSeparator = '--------------------------------';

  Logger.root.onRecord.listen((rec) {
    final content = [
      if (prefix != null) ...[prefix, separator],
      rec.level.name.padRight(7),
      separator,
      rec.loggerName.padRight(22),
      separator,
      rec.message,
    ];

    debugPrint(content.join());

    if (rec.error != null) {
      debugPrint(horizontalSeparator);
      debugPrint('ERROR');

      if (rec.stackTrace != null) {
        debugPrint('STACK TRACE');
        rec.stackTrace.toString().trim().split('\n').forEach(debugPrint);
        debugPrint(horizontalSeparator);
      }
    }
  });
}
