import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/timeline_entity.dart';

part 'timeline_response_entity.g.dart';

@JsonSerializable()
class TimelineResponseEntity implements BaseLayerDataTransformer<TimelineResponseEntity, WeatherDetail> {
  @JsonKey(name: 'timelines')
  final List<TimelineEntity> timelines;

  TimelineResponseEntity(
    this.timelines,
  );

  factory TimelineResponseEntity.fromJson(Map<String, dynamic> json) {
    return _$TimelineResponseEntityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TimelineResponseEntityToJson(this);

  @override
  TimelineResponseEntity restore(dynamic data) {
    throw UnimplementedError();
  }

  @override
  WeatherDetail transform() {
   return timelines.first.transform();
  }
}
