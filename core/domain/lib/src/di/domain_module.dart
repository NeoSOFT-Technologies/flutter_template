import 'package:domain/domain.dart';
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
}
