import 'package:json_annotation/json_annotation.dart';
part 'address.g.dart';

@JsonSerializable()
class Address {
  String? id;
  String? province;
  String? district;
  String? ward;
  String? street;
  bool? status;
  String? nameReciever;
  String? phoneReciever;
  String? idAccount;

  Address(
    this.id,
    this.province,
    this.district,
    this.ward,
    this.street,
    this.status,
    this.nameReciever,
    this.phoneReciever,
    this.idAccount,
  );

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@JsonSerializable()
class AddressRequest {
  String? province;
  String? district;
  String? ward;
  String? street;
  bool? status;
  String? nameReciever;
  String? phoneReciever;

  AddressRequest(this.province, this.district, this.ward, this.street,
      this.status, this.nameReciever, this.phoneReciever);

  // factory AddressRequest.fromJson(Map<String, dynamic> json) =>
  //     _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressRequestToJson(this);
}
