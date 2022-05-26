import 'package:json_annotation/json_annotation.dart';
part 'address.g.dart';

@JsonSerializable()
class Address {
  String? _id;
  String? district;
  String? ward;
  String? street;
  bool? status;
  String? nameReciever;
  // String? phoneReciever;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? __v;
  String? idAccount;

  Address(
    this._id,
    this.district,
    this.ward,
    this.street,
    this.status,
    this.nameReciever,
    // this.phoneReciever,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.__v,
    this.idAccount,
  );

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
