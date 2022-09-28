import 'package:json_annotation/json_annotation.dart';
import 'package:network_retrofit/src/model/request/geometry_request.dart';

part 'create_location_request.g.dart';

@JsonSerializable(explicitToJson: true)
class CreateLocationRequest {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'geometry')
  GeometryRequest? geometryRequest;

  factory CreateLocationRequest.fromJson(Map<String, dynamic> json) => _$CreateLocationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateLocationRequestToJson(this);

  CreateLocationRequest({
    this.name,
    this.geometryRequest,
  });
}
