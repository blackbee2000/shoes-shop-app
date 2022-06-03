import 'package:json_annotation/json_annotation.dart';
part 'profile.g.dart';

@JsonSerializable()
class Profile {
  String? id;
  String? avatar;
  String? fullName;
  String? phoneNumber;
  String? email;
  String? password;
  String? role;
  int? otp;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? __v;
  dynamic favourites;

  Profile(
    this.id,
    this.fullName,
    this.avatar,
    this.phoneNumber,
    this.email,
    this.password,
    this.role,
    this.otp,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.__v,
    this.favourites,
  );

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
