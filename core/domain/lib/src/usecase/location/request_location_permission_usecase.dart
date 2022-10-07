import 'package:domain/domain.dart';
import '../base/base_usecase.dart';

class RequestLocationPermissionUseCase extends BaseUseCase<BaseError, RequestLocationPermissionUseCaseParams, bool> {
  final LocationRepository _locationRepository;

  RequestLocationPermissionUseCase(
      this._locationRepository,
      );

  @override
  Future<Either<BaseError, bool>> execute({required RequestLocationPermissionUseCaseParams params}) {
    return _locationRepository.requestPermissions();
  }
}

class RequestLocationPermissionUseCaseParams extends Params {
  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}