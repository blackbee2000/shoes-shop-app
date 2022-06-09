import 'package:json_annotation/json_annotation.dart';
part 'ward.g.dart';

@JsonSerializable()
class Ward {
  String? code;
  String? name;
  String? district;
  String? province;

  Ward(
    this.name,
    this.code,
    this.district,
    this.province,
  );

  factory Ward.fromJson(Map<String, dynamic> json) => _$WardFromJson(json);

  Map<String, dynamic> toJson() => _$WardToJson(this);
}
