import 'package:shared_preferences/shared_preferences.dart';
import 'package:themes/src/services/platform_service.dart';
import 'package:themes/src/services/sharedpreference_service.dart';
import 'package:themes/src/services/statusbar_service.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ThirdPartyServicesModule {
  @lazySingleton
  StatusBarService get statusBarService => StatusBarService();

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @singleton
  SharedPreferencesService sharedPreferencesService(SharedPreferences prefs) =>
      SharedPreferencesService(prefs);

  @lazySingleton
  PlatformService get platformService => PlatformService();
}
