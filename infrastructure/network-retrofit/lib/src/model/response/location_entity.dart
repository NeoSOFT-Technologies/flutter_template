import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/response/geometry_entity.dart';

part 'location_entity.g.dart';

@JsonSerializable()
class LocationEntity implements BaseLayerDataTransformer<LocationEntity, Location> {
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'geometry')
  final GeometryEntity geometryEntity;

  LocationEntity(
    this.id,
    this.name,
    this.geometryEntity,
  );

  factory LocationEntity.fromJson(Map<String, dynamic> json) {
    return _$LocationEntityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LocationEntityToJson(this);

  @override
  LocationEntity restore(Location data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  Location transform() {
    return Location(
      locationId: id,
      name: name,
      geometryLocation: geometryEntity.transform(),
    );
  }
}
