import 'package:app/feature/dashboard/dashboard_page_view_model.dart';
import 'package:app/feature/splash/splash_page_model.dart';
import 'package:app/feature/weather_detail/weather_detail_page.dart';
import 'package:app/feature/weather_detail/weather_detail_view_model.dart';
import 'package:domain/domain.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../dependencies.dart';

final splashViewModelProvider = ChangeNotifierProvider.autoDispose<SplashViewModel>(
  (ref) =>
      SplashViewModel(getIt.get<String>(instanceName: "BaseUrl"), getIt.get<FlutterExceptionHandlerBinder>()),
);

final dashboardViewModelProvider = ChangeNotifierProvider.autoDispose<DashboardPageViewModel>(
  (ref) =>
      DashboardPageViewModel(getIt.get<CreateLocationUseCase>(), getIt.get<FlutterExceptionHandlerBinder>()),
);

final weatherDetailViewModelProvider =
ChangeNotifierProvider.autoDispose.family<WeatherDetailViewModel, WeatherDetailPageParam>(
  (ref, param) => WeatherDetailViewModel(
    param,
    getIt.get<GetFutureTimelineUseCase>(),
    getIt.get<FlutterExceptionHandlerBinder>(),
  ),
);
