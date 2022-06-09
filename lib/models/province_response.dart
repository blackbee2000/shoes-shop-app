import 'package:json_annotation/json_annotation.dart';
import 'package:shoes_shop_app/models/province.dart';
part 'province_response.g.dart';

@JsonSerializable()
class ProvinceResponse {
  String? status;
  String? message;
  List<Province>? results;

  ProvinceResponse(
    this.status,
    this.message,
    this.results,
  );

  factory ProvinceResponse.fromJson(Map<String, dynamic> json) =>
      _$ProvinceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProvinceResponseToJson(this);
}
