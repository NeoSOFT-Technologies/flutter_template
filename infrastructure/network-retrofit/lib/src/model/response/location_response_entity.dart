import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/location_entity.dart';

part 'location_response_entity.g.dart';

@JsonSerializable()
class LocationResponseEntity implements BaseLayerDataTransformer<LocationResponseEntity, Location> {
  @JsonKey(name: 'data')
  final LocationEntity locationEntity;

  LocationResponseEntity(this.locationEntity);

  factory LocationResponseEntity.fromJson(Map<String, dynamic> json) {
    return _$LocationResponseEntityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LocationResponseEntityToJson(this);

  @override
  LocationResponseEntity restore(Location data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  Location transform() {
    return locationEntity.transform();
  }
}
