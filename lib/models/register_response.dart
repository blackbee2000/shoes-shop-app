import 'package:json_annotation/json_annotation.dart';
import 'package:shoes_shop_app/models/profile.dart';
part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse {
  String? message;
  Profile? data;

  RegisterResponse(
    this.message,
    this.data,
  );

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}
