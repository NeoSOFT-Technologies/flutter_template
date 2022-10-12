import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/timeline_response_entity.dart';

part 'timeline_data_entity.g.dart';

@JsonSerializable()
class TimelineDataEntity implements BaseLayerDataTransformer<TimelineDataEntity, WeatherDetail> {
  @JsonKey(name: 'data')
  final TimelineResponseEntity timelineResponseEntity;

  TimelineDataEntity(this.timelineResponseEntity);

  factory TimelineDataEntity.fromJson(Map<String, dynamic> json) {
    return _$TimelineDataEntityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TimelineDataEntityToJson(this);

  @override
  TimelineDataEntity restore(WeatherDetail data) {
    throw UnimplementedError();
  }

  @override
  WeatherDetail transform() {
    return timelineResponseEntity.transform();
  }
}
