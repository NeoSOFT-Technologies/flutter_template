// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_errors/flutter_errors.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../errors/flutter_snack_bar_error_presenter.dart' as _i4;
import '../errors/flutter_toast_error_presenter.dart' as _i5;
import '../feature/splash/splash_page_model.dart' as _i6;
import 'app_module.dart' as _i8;
import 'error/errors_module.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final errorsModule = _$ErrorsModule();
  final appModule = _$AppModule();
  gh.lazySingleton<_i3.ExceptionMappers>(
      () => errorsModule.providersGlobalErrors());
  gh.singleton<_i4.FlutterSnackBarErrorPresenter>(
      errorsModule.providesSnackBarErrorPresenter());
  gh.singleton<_i5.FlutterToastErrorPresenter>(
      errorsModule.providesToastErrorPresenter());
  gh.factory<String>(
    () => appModule.baseUrl,
    instanceName: 'BaseUrl',
  );
  gh.singleton<_i3.FlutterExceptionHandlerBinder<dynamic>>(
      errorsModule.providerDefaultExceptionHandler(
    get<_i5.FlutterToastErrorPresenter>(),
    get<_i3.ExceptionMappers>(),
  ));
  gh.factoryParam<_i6.SplashViewModel, String, dynamic>((
    myBaseUrl,
    _,
  ) =>
      _i6.SplashViewModel(
        myBaseUrl,
        get<_i3.FlutterExceptionHandlerBinder<dynamic>>(),
      ));
  return get;
}

class _$ErrorsModule extends _i7.ErrorsModule {}

class _$AppModule extends _i8.AppModule {}
