import 'package:domain/domain.dart';

import '../base/base_usecase.dart';

class GetTodayTimeLineUseCase extends BaseUseCase<BaseError, GetTodayTimeLineUseCaseParams, WeatherDetail> {
  final WeatherRepository _weatherRepository;

  GetTodayTimeLineUseCase(
    this._weatherRepository,
  );

  @override
  Future<Either<BaseError, WeatherDetail>> execute({
    required GetTodayTimeLineUseCaseParams params,
  }) async {
    return await _weatherRepository.getTodayTimeline(
      params.location,
    );
  }
}

class GetTodayTimeLineUseCaseParams extends Params {
  final Location location;

  GetTodayTimeLineUseCaseParams(
    this.location,
  );

  @override
  Either<AppError, bool> verify() {
    return Right(true);
  }
}
