import 'package:json_annotation/json_annotation.dart';
import 'package:shoes_shop_app/models/type_product.dart';
part 'profile.g.dart';

@JsonSerializable()
class Profile {
  String? _id;
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
    this._id,
    this.fullName,
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
