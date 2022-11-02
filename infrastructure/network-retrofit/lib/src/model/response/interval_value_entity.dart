import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'interval_value_entity.g.dart';

@JsonSerializable()
class IntervalValueEntity implements BaseLayerDataTransformer<IntervalValueEntity, void> {
  @JsonKey(name: 'humidity')
  final double humidity;
  @JsonKey(name: 'temperature')
  final double temperature;
  @JsonKey(name: 'weatherCode')
  final double weatherCode;
  @JsonKey(name: 'windSpeed')
  final double windSpeed;

  IntervalValueEntity({
    this.humidity = 0.0,
    this.temperature = 0.0,
    this.weatherCode = 0.0,
    this.windSpeed = 0.0,
  });


  factory IntervalValueEntity.fromJson(Map<String, dynamic> json) {
    return _$IntervalValueEntityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$IntervalValueEntityToJson(this);

  @override
  IntervalValueEntity restore(void data) {
    return this;
  }

  @override
  void transform() {
    return;
  }
}
