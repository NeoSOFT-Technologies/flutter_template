import 'package:domain/domain.dart';
import 'package:domain/src/usecase/weather/get_future_timeline_usecase.dart';
import 'package:domain/src/usecase/weather/get_locations_usecase.dart';
import 'package:domain/src/usecase/weather/get_today_timeline_usecase.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DomainModule {
  @lazySingleton
  CreateLocationUseCase createLocationUseCaseProvider(
    WeatherRepository repository,
  ) {
    return CreateLocationUseCase(repository);
  }

  @lazySingleton
  GetLocationsUseCase getLocationsUseCaseProvider(
    WeatherRepository repository,
  ) {
    return GetLocationsUseCase(repository);
  }

  @lazySingleton
  GetTodayTimeLineUseCase getTodayTimelineUseCaseProvider(
    WeatherRepository repository,
  ) {
    return GetTodayTimeLineUseCase(repository);
  }

  @lazySingleton
  GetFutureTimelineUseCase getFutureTimelineUseCaseProvider(
    WeatherRepository repository,
  ) {
    return GetFutureTimelineUseCase(repository);
  }
}
