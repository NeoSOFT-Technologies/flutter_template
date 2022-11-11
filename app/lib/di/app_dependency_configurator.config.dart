// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:domain/domain.dart' as _i16;
import 'package:flutter_errors/flutter_errors.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../errors/flutter_alert_error_presenter.dart' as _i5;
import '../errors/flutter_snack_bar_error_presenter.dart' as _i7;
import '../errors/flutter_toast_error_presenter.dart' as _i8;
import '../feature/dashboard/dashboard_page_model.dart' as _i17;
import '../feature/splash/splash_page_model.dart' as _i13;
import '../feature/tabs/home/home_page_model.dart' as _i9;
import '../feature/tabs/home/widgets/timer_widget/count_down_view_model.dart'
    as _i3;
import '../feature/tabs/navigation/navigation_page_model.dart' as _i10;
import '../feature/tabs/profile/profile_page_model.dart' as _i11;
import '../feature/tabs/search/search_page_model.dart' as _i12;
import '../feature/weather_detail/weather_detail_page.dart' as _i15;
import '../feature/weather_detail/weather_detail_view_model.dart' as _i14;
import '../model/alert_texts.dart' as _i6;
import 'app_module.dart' as _i19;
import 'error/errors_module.dart'
    as _i18; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i3.CountDownViewModel>(
      () => _i3.CountDownViewModel(get<Duration>()));
  gh.lazySingleton<_i4.ExceptionMapperStorage>(
      () => errorsModule.providersGlobalErrors());
  gh.singleton<_i5.FlutterAlertErrorPresenter<_i6.AlertTexts>>(
      errorsModule.providesFlutterAlertErrorPresenter());
  gh.singleton<_i7.FlutterSnackBarErrorPresenter<String>>(
      errorsModule.providesSnackBarErrorPresenter());
  gh.singleton<_i8.FlutterToastErrorPresenter<String>>(
      errorsModule.providesToastErrorPresenter());
  gh.factory<_i9.HomePageViewModel>(() => _i9.HomePageViewModel());
  gh.factory<_i10.NavigationViewModel>(() => _i10.NavigationViewModel());
  gh.factory<_i11.ProfileViewModel>(() => _i11.ProfileViewModel());
  gh.factory<_i12.SearchViewModel>(() => _i12.SearchViewModel());
  gh.singleton<_i4.SelectorErrorPresenter<Object>>(
      errorsModule.providesSelectorErrorPresenter(
    get<_i8.FlutterToastErrorPresenter<String>>(),
    get<_i7.FlutterSnackBarErrorPresenter<String>>(),
    get<_i5.FlutterAlertErrorPresenter<_i6.AlertTexts>>(),
  ));
  gh.factory<String>(
    () => appModule.baseUrl,
    instanceName: 'BaseUrl',
  );
  gh.factory<String>(
    () => appModule.apiKey,
    instanceName: 'ApiKey',
  );
  gh.singleton<_i4.FlutterExceptionHandlerBinder<Object>>(
      errorsModule.providerDefaultExceptionHandler(
    get<_i4.SelectorErrorPresenter<Object>>(),
    get<_i4.ExceptionMapperStorage>(),
  ));
  gh.factoryParam<_i13.SplashViewModel, String, dynamic>((
    myBaseUrl,
    _,
  ) =>
      _i13.SplashViewModel(
        myBaseUrl,
        get<_i4.FlutterExceptionHandlerBinder<Object>>(),
      ));
  gh.factory<_i14.WeatherDetailViewModel>(() => _i14.WeatherDetailViewModel(
        get<_i15.WeatherDetailPageParam>(),
        get<_i16.GetFutureTimelineUseCase>(),
        get<_i4.FlutterExceptionHandlerBinder<Object>>(),
      ));
  gh.factory<_i17.DashboardViewModel>(() => _i17.DashboardViewModel(
        get<_i16.CheckLocationPermissionUseCase>(),
        get<_i16.RequestLocationPermissionUseCase>(),
        get<_i16.GetLocationUseCase>(),
        get<_i16.CreateLocationUseCase>(),
        get<_i4.FlutterExceptionHandlerBinder<Object>>(),
      ));
  return get;
}

class _$ErrorsModule extends _i18.ErrorsModule {}

class _$AppModule extends _i19.AppModule {}
