import 'dart:async';

import 'package:calendar_app/core/logger/app_logger.dart';
import 'package:flutter/material.dart';

class GlobalErrorHandler with AppLogger {
  GlobalErrorHandler({required FutureOr<Widget> Function() builder}) {
    runZonedGuarded(() async {
      final child = await builder();
      runApp(child);
    }, _handleError);
  }

  Future<void> _handleError(Object error, StackTrace stackTrace) async {
    // FirebaseCrashlytics.instance.recordError(error, stackTrace);
    if (error is! StateError) {
      log.severe('Handled error', error, stackTrace);
    }
  }
}
