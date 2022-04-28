import 'package:json_annotation/json_annotation.dart';
part 'address_order.g.dart';

@JsonSerializable()
class AddressOrder {
  String? _id;
  String? district;
  String? ward;
  String? street;
  bool? status;
  String? nameReciever;
  String? phoneReciever;

  AddressOrder(
    this._id,
    this.district,
    this.ward,
    this.street,
    this.status,
    this.nameReciever,
    this.phoneReciever,
  );

  factory AddressOrder.fromJson(Map<String, dynamic> json) =>
      _$AddressOrderFromJson(json);

  Map<String, dynamic> toJson() => _$AddressOrderToJson(this);
}
