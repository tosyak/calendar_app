import 'dart:convert';

Map<String, Map<String, String>> languageModelFromJson(String str) {
  final parsedJson = json.decode(str);
  final dataMap = parsedJson['data'] as Map<String, dynamic>;

  return dataMap.map((key, value) =>
      MapEntry(key, Map<String, String>.from(value as Map<String, dynamic>)));
}

// Map<String, Map<String, String>> languageModelFromJson(String str) {
//   final parsedJson = json.decode(str);
//   final dataMap = parsedJson['record']['data'] as Map<String, dynamic>;

//   return dataMap.map((key, value) =>
//       MapEntry(key, Map<String, String>.from(value as Map<String, dynamic>)));
// }