import 'package:calendar_app/core/locale_cubit/data/locale_model.dart';
import 'package:calendar_app/core/logger/app_logger.dart';
import 'package:calendar_app/core/network/api_client.dart';
import 'package:flutter/services.dart';

abstract class LanguageDataSource extends ApiClient with AppLogger {
  Future<Map<String, Map<String, String>>> fetchLanguages();
}

class LanguageDataSourceImpl extends LanguageDataSource {
  @override
  Future<Map<String, Map<String, String>>> fetchLanguages() async {
    try {
      final res = await rootBundle.loadString('assets/locale.json');
      return languageModelFromJson(res);
    } catch (e) {
      log.severe('Error loading or parsing locale.json: $e');
      rethrow;
    }
  }
}

// abstract class LanguageDataSource extends ApiClient {
//   Future<Map<String, dynamic>> fetchLanguages();
// }

// class LanguageDataSourceImpl extends LanguageDataSource {
//   @override
//   Future<Map<String, dynamic>> fetchLanguages() async {
//     try {
//       final res = await dio.get(
//         'https://api.jsonbin.io/v3/b/67dc4c958a456b79667999fb',
//       );

//       return languageModelFromJson(json.encode(res.data));
//     } catch (e) {
//       print('Error loading or parsing locale.json: $e');
//       rethrow;
//     }
//   }
// }
