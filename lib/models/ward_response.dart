import 'package:json_annotation/json_annotation.dart';
import 'package:shoes_shop_app/models/ward.dart';
part 'ward_response.g.dart';

@JsonSerializable()
class WardResponse {
  String? status;
  String? message;
  List<Ward>? results;

  WardResponse(
    this.status,
    this.message,
    this.results,
  );

  factory WardResponse.fromJson(Map<String, dynamic> json) =>
      _$WardResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WardResponseToJson(this);
}
