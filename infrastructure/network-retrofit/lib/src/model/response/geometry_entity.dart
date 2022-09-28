import 'package:data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'geometry_entity.g.dart';

@JsonSerializable()
class GeometryEntity implements BaseLayerDataTransformer<GeometryEntity, GeometryLocation> {
  @JsonKey(name: 'type')
  final String type;
  @JsonKey(name: 'coordinates')
  final List<double> coordinates;

  GeometryEntity(
    this.type,
    this.coordinates,
  );

  factory GeometryEntity.fromJson(Map<String, dynamic> json) {
    return _$GeometryEntityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GeometryEntityToJson(this);

  @override
  GeometryEntity restore(GeometryLocation data) {
    // TODO: implement restore
    throw UnimplementedError();
  }

  @override
  GeometryLocation transform() {
    return GeometryLocation(
      type: type,
      coordinates: coordinates,
    );
  }
}
