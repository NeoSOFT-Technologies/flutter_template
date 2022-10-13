import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/timeline_interval_entity.dart';

part 'timeline_entity.g.dart';

@JsonSerializable()
class TimelineEntity implements BaseLayerDataTransformer<TimelineEntity, WeatherDetail> {
  @JsonKey(name: 'startTime')
  final String startTime;
  @JsonKey(name: 'endTime')
  final String endTime;
  @JsonKey(name: 'intervals')
  final List<TimelineIntervalEntity> timelineIntervalEntity;

  TimelineEntity(
    this.startTime,
    this.endTime,
    this.timelineIntervalEntity,
  );

  factory TimelineEntity.fromJson(Map<String, dynamic> json) {
    return _$TimelineEntityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TimelineEntityToJson(this);

  @override
  TimelineEntity restore(dynamic data) {
    throw UnimplementedError();
  }

  @override
  WeatherDetail transform() {
    return WeatherDetail(
      startTime: DateFormatter.yyyyMMddHHmmss.parse(startTime,true),
      endTime: DateFormatter.yyyyMMddHHmmss.parse(endTime,true),
      weatherTimeline: timelineIntervalEntity.map((e) => e.transform()).toList(),
    );
  }
}
