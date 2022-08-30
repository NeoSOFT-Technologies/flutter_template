// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

import '../services/platform_service.dart' as _i3;
import '../services/sharedpreference_service.dart' as _i5;
import '../services/statusbar_service.dart' as _i6;
import 'module/thirdparty_services.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initThemeGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  gh.lazySingleton<_i3.PlatformService>(
      () => thirdPartyServicesModule.platformService);
  await gh.factoryAsync<_i4.SharedPreferences>(
      () => thirdPartyServicesModule.prefs,
      preResolve: true);
  gh.singleton<_i5.SharedPreferencesService>(thirdPartyServicesModule
      .sharedPreferencesService(get<_i4.SharedPreferences>()));
  gh.lazySingleton<_i6.StatusBarService>(
      () => thirdPartyServicesModule.statusBarService);
  return get;
}

class _$ThirdPartyServicesModule extends _i7.ThirdPartyServicesModule {}
