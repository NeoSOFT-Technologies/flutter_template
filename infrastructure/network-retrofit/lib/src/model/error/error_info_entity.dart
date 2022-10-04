import 'package:json_annotation/json_annotation.dart';

part 'error_info_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class ErrorInfoEntity {
  @JsonKey(name: 'code')
  int? code;
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'message')
  String? message;

  //
  factory ErrorInfoEntity.fromJson(Map<String, dynamic> json) => _$ErrorInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorInfoEntityToJson(this);

  ErrorInfoEntity({
    this.type,
    this.code,
    this.message,
  });
}
