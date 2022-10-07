import 'package:domain/domain.dart';

import '../base/base_usecase.dart';

class GetLocationUseCase extends BaseUseCase<BaseError, GetLocationUseCaseParams, GeoLocation> {
  final LocationRepository _locationRepository;

  GetLocationUseCase(
      this._locationRepository,
      );

  @override
  Future<Either<BaseError, GeoLocation>> execute({required GetLocationUseCaseParams params})  {
    return  _locationRepository.getLocation();
  }
}

class GetLocationUseCaseParams extends Params {
  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}