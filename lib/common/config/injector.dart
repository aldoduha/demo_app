import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'injector.iconfig.dart' as injection_config;

final getIt = GetIt.instance;
Future<void> setupInjections() async {

  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerLazySingleton(() => http.Client());
  configure();
}

@injectableInit
void configure() => injection_config.$initGetIt();