// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../feature/splash/splash_page_model.dart' as _i3;
import 'app_module.dart' as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appModule = _$AppModule();
  gh.factoryParam<_i3.SplashViewModel, String, dynamic>(
      (myBaseUrl, _) => _i3.SplashViewModel(myBaseUrl));
  gh.factory<String>(() => appModule.baseUrl, instanceName: 'BaseUrl');
  return get;
}

class _$AppModule extends _i4.AppModule {}
