import 'package:domain/domain.dart';

import '../base/base_usecase.dart';

class GetLocationsUseCase extends BaseUseCase<BaseError, GetLocationsUseCaseParams, List<Location>> {
  final WeatherRepository _weatherRepository;

  GetLocationsUseCase(
    this._weatherRepository,
  );

  @override
  Future<Either<BaseError, List<Location>>> execute({
    required GetLocationsUseCaseParams params,
  }) async {
    return await _weatherRepository.getLocations();
  }
}

class GetLocationsUseCaseParams extends Params {
  GetLocationsUseCaseParams();

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
