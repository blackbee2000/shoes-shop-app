import 'package:json_annotation/json_annotation.dart';
part 'district.g.dart';

@JsonSerializable()
class District {
  String? code;
  String? name;
  String? province;

  District(
    this.name,
    this.code,
    this.province,
  );

  factory District.fromJson(Map<String, dynamic> json) =>
      _$DistrictFromJson(json);

  Map<String, dynamic> toJson() => _$DistrictToJson(this);
}
