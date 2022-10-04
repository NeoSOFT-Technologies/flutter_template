// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:data/data.dart' as _i6;
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i4;

import '../services/retrofit_service.dart' as _i5;
import 'network_module.dart' as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initNetworkGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final networkModule = _$NetworkModule();
  gh.singleton<_i3.BaseOptions>(
      networkModule.providerBaseConfig(get<String>(instanceName: 'BaseUrl')));
  gh.singleton<_i4.PrettyDioLogger>(networkModule.providerPrettyLogger());
  gh.singleton<List<_i3.Interceptor>>(
      networkModule.providerInterceptors(get<_i4.PrettyDioLogger>()));
  gh.lazySingleton<_i3.Dio>(() => networkModule.providerDio(
        get<_i3.BaseOptions>(),
        get<List<_i3.Interceptor>>(),
      ));
  gh.lazySingleton<_i5.RetrofitService>(
      () => networkModule.providerRetrofitService(get<_i3.Dio>()));
  gh.lazySingleton<_i6.NetworkPort>(
      () => networkModule.providerNetworkService(get<_i5.RetrofitService>()));
  return get;
}

class _$NetworkModule extends _i7.NetworkModule {}
