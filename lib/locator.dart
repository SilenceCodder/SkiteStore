import 'package:get_it/get_it.dart';

import 'package:skitestore/core/services/dialog_service.dart';
import 'package:skitestore/core/services/navigation_service.dart';
GetIt locator = GetIt.instance;

void setupLocator() {
// locator.registerLazySingleton(() => CustomFunction());
// locator.registerLazySingleton(() => AuthService());
// locator.registerLazySingleton(() => Api());

locator.registerLazySingleton(() => NavigationService());
locator.registerLazySingleton(() => DialogService());

}
