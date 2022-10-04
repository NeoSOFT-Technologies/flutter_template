
import 'package:domain/domain.dart';
import '../base/base_usecase.dart';

class CheckLocationServiceEnabledUseCase extends BaseUseCase<BaseError, CheckLocationServiceEnabledUseCaseParams, bool> {
  final LocationRepository _locationRepository;

  CheckLocationServiceEnabledUseCase(
      this._locationRepository,
      );

  @override
  Future<Either<BaseError, bool>> execute({required CheckLocationServiceEnabledUseCaseParams params}) async {
    return await _locationRepository.isLocationServiceEnabled();
  }
}

class CheckLocationServiceEnabledUseCaseParams extends Params {
  @override
  Either<AppError, bool> verify() {
    // TODO: implement verify
    throw UnimplementedError();
  }
}