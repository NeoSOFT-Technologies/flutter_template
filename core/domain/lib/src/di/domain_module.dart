import 'package:domain/domain.dart';
import 'package:domain/src/repository/weather_repository.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DomainModule {
  @lazySingleton
  CreateLocationUseCase createLocationUseCaseProvider(
    WeatherRepository repository,
  ) {
    return CreateLocationUseCase(repository);
  }
}
