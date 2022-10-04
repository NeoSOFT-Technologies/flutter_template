// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:domain/domain.dart' as _i13;
import 'package:flutter_errors/flutter_errors.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../errors/flutter_snack_bar_error_presenter.dart' as _i5;
import '../errors/flutter_toast_error_presenter.dart' as _i6;
import '../feature/dashboard/dashboard_page_model.dart' as _i12;
import '../feature/splash/splash_page_model.dart' as _i11;
import '../feature/tabs/home/home_page_model.dart' as _i7;
import '../feature/tabs/home/widgets/timer_widget/count_down_view_model.dart'
    as _i3;
import '../feature/tabs/navigation/navigation_page_model.dart' as _i8;
import '../feature/tabs/profile/profile_page_model.dart' as _i9;
import '../feature/tabs/search/search_page_model.dart' as _i10;
import 'app_module.dart' as _i15;
import 'error/errors_module.dart'
    as _i14; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i4.ExceptionMappers>(
      () => errorsModule.providersGlobalErrors());
  gh.singleton<_i5.FlutterSnackBarErrorPresenter>(
      errorsModule.providesSnackBarErrorPresenter());
  gh.singleton<_i6.FlutterToastErrorPresenter>(
      errorsModule.providesToastErrorPresenter());
  gh.factory<_i7.HomePageViewModel>(() => _i7.HomePageViewModel());
  gh.factory<_i8.NavigationViewModel>(() => _i8.NavigationViewModel());
  gh.factory<_i9.ProfileViewModel>(() => _i9.ProfileViewModel());
  gh.factory<_i10.SearchViewModel>(() => _i10.SearchViewModel());
  gh.factory<String>(
    () => appModule.baseUrl,
    instanceName: 'BaseUrl',
  );
  gh.factory<String>(
    () => appModule.apiKey,
    instanceName: 'ApiKey',
  );
  gh.singleton<_i4.FlutterExceptionHandlerBinder<dynamic>>(
      errorsModule.providerDefaultExceptionHandler(
    get<_i6.FlutterToastErrorPresenter>(),
    get<_i4.ExceptionMappers>(),
  ));
  gh.factoryParam<_i11.SplashViewModel, String, dynamic>((
    myBaseUrl,
    _,
  ) =>
      _i11.SplashViewModel(
        myBaseUrl,
        get<_i4.FlutterExceptionHandlerBinder<dynamic>>(),
      ));
  gh.factory<_i12.DashboardViewModel>(() => _i12.DashboardViewModel(
        get<_i13.CheckLocationPermissionUseCase>(),
        get<_i13.RequestLocationPermissionUseCase>(),
        get<_i13.GetLocationUseCase>(),
        get<_i13.CreateLocationUseCase>(),
        get<_i4.FlutterExceptionHandlerBinder<dynamic>>(),
      ));
  return get;
}

class _$ErrorsModule extends _i14.ErrorsModule {}

class _$AppModule extends _i15.AppModule {}
