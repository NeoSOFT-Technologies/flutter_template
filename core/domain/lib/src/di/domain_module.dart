import 'package:domain/domain.dart';
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
  GetLocationUseCase fetchCurrentLocationUseCaseProvider(
    LocationRepository repository,
  ) {
    return GetLocationUseCase(repository);
  }

  @lazySingleton
  CheckLocationPermissionUseCase checkLocationPermissionUseCaseProvider(
    LocationRepository repository,
  ) {
    return CheckLocationPermissionUseCase(repository);
  }

  @lazySingleton
  RequestLocationPermissionUseCase requestLocationPermissionUseCaseProvider(
    LocationRepository repository,
  ) {
    return RequestLocationPermissionUseCase(repository);
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
