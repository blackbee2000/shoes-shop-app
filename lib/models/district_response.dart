import 'package:json_annotation/json_annotation.dart';
import 'package:shoes_shop_app/models/district.dart';
part 'district_response.g.dart';

@JsonSerializable()
class DistrictResponse {
  String? status;
  String? message;
  List<District>? results;

  DistrictResponse(
    this.status,
    this.message,
    this.results,
  );

  factory DistrictResponse.fromJson(Map<String, dynamic> json) =>
      _$DistrictResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DistrictResponseToJson(this);
}
