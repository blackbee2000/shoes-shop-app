import 'package:json_annotation/json_annotation.dart';
import 'package:shoes_shop_app/models/address.dart';
part 'address_delete.g.dart';

@JsonSerializable()
class AddressDelete {
  String? message;
  Address? data;

  AddressDelete(
    this.message,
    this.data,
  );

  factory AddressDelete.fromJson(Map<String, dynamic> json) =>
      _$AddressDeleteFromJson(json);

  Map<String, dynamic> toJson() => _$AddressDeleteToJson(this);
}
