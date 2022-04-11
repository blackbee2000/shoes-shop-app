import 'package:json_annotation/json_annotation.dart';
part 'auth_data.g.dart';

@JsonSerializable()
class AuthData {
  String? token;
  String? role;

  AuthData(
    this.token,
    this.role,
  );

  factory AuthData.fromJson(Map<String, dynamic> json) =>
      _$AuthDataFromJson(json);

  Map<String, dynamic> toJson() => _$AuthDataToJson(this);
}
