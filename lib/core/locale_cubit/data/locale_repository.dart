import 'package:calendar_app/core/locale_cubit/data/locale_datasource.dart';

abstract class LanguageRepository {
  Future<Map<String, dynamic>> getLanguageList();
}

class LanguageRepositoryImpl extends LanguageRepository {
  final LanguageDataSource remoteDataSource;

  LanguageRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Map<String, dynamic>> getLanguageList() async {
    return await remoteDataSource.fetchLanguages();
  }
}
