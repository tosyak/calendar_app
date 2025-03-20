import 'package:calendar_app/core/app_router/router.dart';
import 'package:calendar_app/data/datasources/local/app_preferences.dart';
import 'package:calendar_app/data/datasources/local/shared_prefs_manager.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupServices() async {
  getIt.registerSingletonAsync<SharedPreferences>(
    () async => await SharedPreferences.getInstance(),
  );

  getIt.registerSingletonWithDependencies<AppPreferences>(
    () => SharedPrefsManager(getIt<SharedPreferences>()),
    dependsOn: [SharedPreferences],
  );

  getIt.registerSingleton<AppRouter>(AppRouter());

  getIt.registerSingleton<Connectivity>(Connectivity());

  await getIt.allReady();
}
