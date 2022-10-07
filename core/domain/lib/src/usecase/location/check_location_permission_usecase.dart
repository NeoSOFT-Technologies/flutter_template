

import 'package:domain/domain.dart';

import '../base/base_usecase.dart';

class CheckLocationPermissionUseCase extends BaseUseCase<BaseError, CheckLocationPermissionUseCaseParams, bool> {
  final LocationRepository _locationRepository;

  CheckLocationPermissionUseCase(
      this._locationRepository,
      );

  @override
  Future<Either<BaseError, bool>> execute({required CheckLocationPermissionUseCaseParams params})  {
    return  _locationRepository.checkPermissions();
  }
}

class CheckLocationPermissionUseCaseParams extends Params {
  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}