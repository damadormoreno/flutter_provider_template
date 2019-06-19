import 'package:get_it/get_it.dart';

import 'core/repositories/spacex_repository.dart';
import 'package:flutter_provider_astro/core/datasource/services/spacex_api.dart';
import 'core/viewmodels/home_viewmodel.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => SpacexApi());
  locator.registerLazySingleton(() => SpacexRepository());

  locator.registerFactory(() => HomeViewModel());
}
