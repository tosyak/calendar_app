import 'package:calendar_app/core/logger/app_logger.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:mocktail/mocktail.dart';

class MockLogger extends Mock implements Logger {}

void main() {
  group('AppLogger', () {
    test('Logger should log messages', () {
      final logger = Logger('TestLogger');
      initializeLogger(prefix: 'TEST');

      expect(() => logger.info('This is a test log'), returnsNormally);
    });

    test('Logger should handle errors', () {
      final logger = Logger('ErrorLogger');
      initializeLogger();

      expect(
        () => logger.severe('This is an error', Exception('Test Exception'),
            StackTrace.current),
        returnsNormally,
      );
    });

    test('Logger should handle HTTP response errors', () {
      final logger = Logger('HttpLogger');
      initializeLogger();

      final response = http.Response('Internal Server Error', 500);

      expect(
        () => logger.severe('HTTP Error', response, StackTrace.current),
        returnsNormally,
      );
    });
  });
}
