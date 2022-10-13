import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/interval_value_entity.dart';

part 'timeline_interval_entity.g.dart';

@JsonSerializable()
class TimelineIntervalEntity implements BaseLayerDataTransformer<TimelineIntervalEntity, WeatherTimeline> {
  @JsonKey(name: 'startTime')
  final String startTime;
  @JsonKey(name: 'values')
  final IntervalValueEntity intervalValueEntity;

  TimelineIntervalEntity(
    this.startTime,
    this.intervalValueEntity,
  );

  factory TimelineIntervalEntity.fromJson(Map<String, dynamic> json) {
    return _$TimelineIntervalEntityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TimelineIntervalEntityToJson(this);

  @override
  TimelineIntervalEntity restore(dynamic data) {
    throw UnimplementedError();
  }

  @override
  WeatherTimeline transform() {
    return WeatherTimeline(
      dateTime: DateFormatter.yyyyMMddHHmmss.parse(startTime, true),
      wind: intervalValueEntity.windSpeed,
      humidity: intervalValueEntity.humidity,
      temperature: intervalValueEntity.temperature,
      weatherEnum: WeatherEnum.unknown.fromCode(
        intervalValueEntity.weatherCode,
      ),
    );
  }
}
