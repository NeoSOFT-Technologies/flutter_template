// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../domain.dart' as _i3;
import '../usecase/weather/get_future_timeline_usecase.dart' as _i4;
import '../usecase/weather/get_locations_usecase.dart' as _i5;
import '../usecase/weather/get_today_timeline_usecase.dart' as _i6;
import 'domain_module.dart' as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initDomainGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final domainModule = _$DomainModule();
  gh.lazySingleton<_i3.CreateLocationUseCase>(() =>
      domainModule.createLocationUseCaseProvider(get<_i3.WeatherRepository>()));
  gh.lazySingleton<_i4.GetFutureTimelineUseCase>(() => domainModule
      .getFutureTimelineUseCaseProvider(get<_i3.WeatherRepository>()));
  gh.lazySingleton<_i5.GetLocationsUseCase>(() =>
      domainModule.getLocationsUseCaseProvider(get<_i3.WeatherRepository>()));
  gh.lazySingleton<_i6.GetTodayTimeLineUseCase>(() => domainModule
      .getTodayTimelineUseCaseProvider(get<_i3.WeatherRepository>()));
  return get;
}

class _$DomainModule extends _i7.DomainModule {}
