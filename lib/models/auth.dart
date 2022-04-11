import 'package:json_annotation/json_annotation.dart';
import 'package:shoes_shop_app/models/auth_data.dart';
part 'auth.g.dart';

@JsonSerializable()
class Auth {
  String? message;
  AuthData? data;

  Auth(
    this.message,
    this.data,
  );

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);

  Map<String, dynamic> toJson() => _$AuthToJson(this);
}
