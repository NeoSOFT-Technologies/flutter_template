import 'package:shared/shared.dart';

class WeatherDetail {
  final DateTime startTime;
  final DateTime endTime;
  final List<WeatherTimeline> weatherTimeline;

  WeatherDetail({
    required this.endTime,
    required this.startTime,
    required this.weatherTimeline,
  });
}
