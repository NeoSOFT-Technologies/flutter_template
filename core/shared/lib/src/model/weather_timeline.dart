import 'package:shared/shared.dart';
import 'package:shared/src/model/weather_enum.dart';

class WeatherTimeline {
  final double wind;
  final double humidity;
  final double temperature;
  final WeatherEnum weatherEnum;
  final DateTime dateTime;

  WeatherTimeline({
    this.wind = 0,
    this.humidity = 0,
    this.temperature = 0,
    required this.weatherEnum,
    required this.dateTime,
  });
}
