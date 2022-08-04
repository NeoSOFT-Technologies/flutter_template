import 'package:get_it/get_it.dart';

import 'services/platform_service.dart';
import 'services/sharedpreference_service.dart';
import 'services/statusbar_service.dart';

final locator = GetIt.asNewInstance();

Future setupLocator() async {
  SharedPreferencesService sharedPreferences =
      await SharedPreferencesService.getInstance();
  locator.registerSingleton(sharedPreferences);

  locator.registerLazySingleton(() => StatusBarService());
  locator.registerLazySingleton(() => PlatformService());
}
