// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:domain/domain.dart' as _i11;
import 'package:flutter_errors/flutter_errors.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../errors/flutter_alert_error_presenter.dart' as _i4;
import '../errors/flutter_snack_bar_error_presenter.dart' as _i6;
import '../errors/flutter_toast_error_presenter.dart' as _i7;
import '../feature/dashboard/dashboard_page_view_model.dart' as _i12;
import '../feature/splash/splash_page_model.dart' as _i8;
import '../feature/weather_detail/weather_detail_page.dart' as _i10;
import '../feature/weather_detail/weather_detail_view_model.dart' as _i9;
import '../model/alert_texts.dart' as _i5;
import 'app_module.dart' as _i14;
import 'error/errors_module.dart'
    as _i13; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i3.ExceptionMapperStorage>(
      () => errorsModule.providersGlobalErrors());
  gh.singleton<_i4.FlutterAlertErrorPresenter<_i5.AlertTexts>>(
      errorsModule.providesFlutterAlertErrorPresenter());
  gh.singleton<_i6.FlutterSnackBarErrorPresenter<String>>(
      errorsModule.providesSnackBarErrorPresenter());
  gh.singleton<_i7.FlutterToastErrorPresenter<String>>(
      errorsModule.providesToastErrorPresenter());
  gh.singleton<_i3.SelectorErrorPresenter<Object>>(
      errorsModule.providesSelectorErrorPresenter(
    get<_i7.FlutterToastErrorPresenter<String>>(),
    get<_i6.FlutterSnackBarErrorPresenter<String>>(),
    get<_i4.FlutterAlertErrorPresenter<_i5.AlertTexts>>(),
  ));
  gh.factory<String>(
    () => appModule.baseUrl,
    instanceName: 'BaseUrl',
  );
  gh.factory<String>(
    () => appModule.apiKey,
    instanceName: 'ApiKey',
  );
  gh.singleton<_i3.FlutterExceptionHandlerBinder<Object>>(
      errorsModule.providerDefaultExceptionHandler(
    get<_i3.SelectorErrorPresenter<Object>>(),
    get<_i3.ExceptionMapperStorage>(),
  ));
  gh.factoryParam<_i8.SplashViewModel, String, dynamic>((
    myBaseUrl,
    _,
  ) =>
      _i8.SplashViewModel(
        myBaseUrl,
        get<_i3.FlutterExceptionHandlerBinder<Object>>(),
      ));
  gh.factory<_i9.WeatherDetailViewModel>(() => _i9.WeatherDetailViewModel(
        get<_i10.WeatherDetailPageParam>(),
        get<_i11.GetFutureTimelineUseCase>(),
        get<_i3.FlutterExceptionHandlerBinder<Object>>(),
      ));
  gh.factory<_i12.DashboardPageViewModel>(() => _i12.DashboardPageViewModel(
        get<_i11.CreateLocationUseCase>(),
        get<_i3.FlutterExceptionHandlerBinder<Object>>(),
      ));
  return get;
}

class _$ErrorsModule extends _i13.ErrorsModule {}

class _$AppModule extends _i14.AppModule {}
