import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_clean_architecture/data/network/app_http_client.dart';
import 'package:flutter_clean_architecture/data/network/network_status.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/data_source/remote_data_source.dart';
import '../data/network/dio_factory.dart';
import '../data/repository/user_repository_impl.dart';
import '../domain/repository/user_repository.dart';
import 'app_preference.dart';

final locator = GetIt.instance;

Future<void> init() async {
  locator.registerLazySingleton<NetworkStatus>(
      () => NetworkStatusImpl(DataConnectionChecker()));

  final sharedPrefs = await SharedPreferences.getInstance();
  locator
      .registerLazySingleton<AppPreference>(() => AppPreference(sharedPrefs));

  locator.registerLazySingleton<DioFactory>(() => DioFactory(locator()));

  final dio = await locator<DioFactory>().getDio();
  locator.registerLazySingleton<AppHttpClient>(() => AppHttpClient(dio));

  locator.registerLazySingleton<RemoteDataSource>(() =>
      RemoteDataSourceImpl(locator<AppHttpClient>())); // <AppHttpClient> 생략가능

  locator.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(locator(), locator()));
  // locator.registerLazySingleton<UserRepository>(
  //     () => UserRepositoryImpl(locator<NetworkStatus>(), locator<RemoteDataSource>()));
}
