import 'package:app/feature/weather_detail/weather_detail_page.dart';
import 'package:domain/domain.dart';
import 'package:flutter_errors/flutter_errors.dart';
import 'package:injectable/injectable.dart';
import 'package:app/model/resource.dart';
import 'package:app/utils/request_manager.dart';
import 'package:rxdart/rxdart.dart';
import 'package:statemanagement_riverpod/statemanagement_riverpod.dart';

@injectable
class WeatherDetailViewModel extends BasePageViewModel {
  final WeatherDetailPageParam weatherDetailPageParam;
  final GetFutureTimelineUseCase getFutureTimelineUseCase;
  final FlutterExceptionHandlerBinder exceptionHandlerBinder;
  final PublishSubject<Resource<WeatherDetail>> _weatherResponse = PublishSubject();

  Stream<Resource<WeatherDetail>> get weatherResponse => _weatherResponse.stream;

  WeatherDetailViewModel(
    this.weatherDetailPageParam,
    this.getFutureTimelineUseCase,
    this.exceptionHandlerBinder,
  ) {
    getTimeLine();
  }

  void getTimeLine() {
    exceptionHandlerBinder.handle(block: () {
      GetFutureTimelineUseCaseParams params = GetFutureTimelineUseCaseParams(
        weatherDetailPageParam.location,
      );
      RequestManager<WeatherDetail>(
        params,
        createCall: () => getFutureTimelineUseCase.execute(
          params: params,
        ),
      ).asFlow().listen((result) {
        _weatherResponse.add(result);
      });
    }).execute();
  }
}
