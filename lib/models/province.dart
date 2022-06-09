import 'package:json_annotation/json_annotation.dart';
part 'province.g.dart';

@JsonSerializable()
class Province {
  String? code;
  String? name;

  Province(
    this.name,
    this.code,
  );

  factory Province.fromJson(Map<String, dynamic> json) =>
      _$ProvinceFromJson(json);

  Map<String, dynamic> toJson() => _$ProvinceToJson(this);
}
