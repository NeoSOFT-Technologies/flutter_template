import 'package:domain/domain.dart';

import '../base/base_usecase.dart';

class CreateLocationUseCase extends BaseUseCase<BaseError, CreateLocationUseCaseParams, Location> {
  final WeatherRepository _weatherRepository;

  CreateLocationUseCase(
    this._weatherRepository,
  );

  @override
  Future<Either<BaseError, Location>> execute({required CreateLocationUseCaseParams params}) async {
    return await _weatherRepository.createLocation(
      name: params.name,
      lat: params.lat,
      lan: params.lan,
    );
  }
}

class CreateLocationUseCaseParams extends Params {
  final String name;
  final double lat;
  final double lan;

  CreateLocationUseCaseParams({
    required this.name,
    required this.lan,
    required this.lat,
  });

  @override
  Either<AppError, bool> verify() {
    if (Validator.isEmpty(name)) {
      return Left(
        AppError(
          type: ErrorType.uiEmptyLocationName,
          throwable: Exception(),
          error: ErrorInfo(message: ''),
        ),
      );
    } else if (lat == 0.0 || lan == 0.0) {
      return Left(
        AppError(
          type: ErrorType.uiNoLocation,
          throwable: Exception(),
          error: ErrorInfo(message: ''),
        ),
      );
    } else {
      return Right(true);
    }
  }
}
