import 'package:json_annotation/json_annotation.dart';
import 'package:shoes_shop_app/models/address.dart';
part 'address_response.g.dart';

@JsonSerializable()
class AddressResponse {
  String? message;
  List<Address>? data;

  AddressResponse(
    this.message,
    this.data,
  );

  factory AddressResponse.fromJson(Map<String, dynamic> json) =>
      _$AddressResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddressResponseToJson(this);
}

@JsonSerializable()
class OneAddressResponse {
  String? message;
  Address? data;

  OneAddressResponse(
    this.message,
    this.data,
  );

  factory OneAddressResponse.fromJson(Map<String, dynamic> json) =>
      _$OneAddressResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OneAddressResponseToJson(this);
}
