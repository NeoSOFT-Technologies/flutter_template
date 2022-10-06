import 'package:domain/domain.dart';

import '../base/base_usecase.dart';

class GetFutureTimelineUseCase extends BaseUseCase<BaseError, GetFutureTimelineUseCaseParams, WeatherDetail> {
  final WeatherRepository _weatherRepository;

  GetFutureTimelineUseCase(
    this._weatherRepository,
  );

  @override
  Future<Either<BaseError, WeatherDetail>> execute({
    required GetFutureTimelineUseCaseParams params,
  }) async {
    return await _weatherRepository.getFutureTimeline(
      params.location,
    );
  }
}

class GetFutureTimelineUseCaseParams extends Params {
  final Location location;

  GetFutureTimelineUseCaseParams(
    this.location,
  );

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
