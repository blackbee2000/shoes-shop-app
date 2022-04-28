import 'package:json_annotation/json_annotation.dart';
import 'package:shoes_shop_app/models/profile.dart';
part 'profile_response.g.dart';

@JsonSerializable()
class ProfileResponse {
  String? message;
  List<Profile>? data;

  ProfileResponse(
    this.message,
    this.data,
  );

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);
}
