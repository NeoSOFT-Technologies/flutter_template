// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:domain/domain.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data.dart' as _i4;
import 'data_module.dart' as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initDataGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final dataModule = _$DataModule();
  gh.lazySingleton<_i3.LocationRepository>(
      () => dataModule.locationRepositoryProvider(get<_i4.LocationPort>()));
  gh.lazySingleton<_i3.UserRepository>(() => dataModule.userRepositoryProvider(
        get<_i4.DatabasePort>(),
        get<_i4.NetworkPort>(),
      ));
  gh.lazySingleton<_i3.WeatherRepository>(
      () => dataModule.weatherRepositoryProvider(
            get<_i4.DatabasePort>(),
            get<_i4.NetworkPort>(),
          ));
  return get;
}

class _$DataModule extends _i5.DataModule {}
