import 'package:json_annotation/json_annotation.dart';

part 'geometry_request.g.dart';

@JsonSerializable(explicitToJson: true)
class GeometryRequest {
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'coordinates')
  List<double> coordinates;

  factory GeometryRequest.fromJson(Map<String, dynamic> json) => _$GeometryRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GeometryRequestToJson(this);

  GeometryRequest({
    this.type = 'Point',
    required this.coordinates,
  });
}
