import 'package:json_annotation/json_annotation.dart';
import 'package:shoes_shop_app/models/address.dart';
import 'package:shoes_shop_app/models/cart.dart';
import 'package:shoes_shop_app/models/list_cart.dart';
part 'bill.g.dart';

@JsonSerializable()
class Bill {
  String? typePayment;
  String? id;
  // List<Cart>? lstCart;
  String? idAccount;
  int? status;
  int? totalDiscount;
  int? totalShipping;
  int? totalPriceProduct;
  int? totalPrice;
  bool? statusPayment;
  // Address? address;
  String? voucher;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? __v;

  Bill(
    this.typePayment,
    this.id,
    // this.lstCart,
    this.idAccount,
    this.status,
    this.totalDiscount,
    this.totalShipping,
    this.totalPriceProduct,
    this.totalPrice,
    this.statusPayment,
    // this.address,
    this.voucher,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.__v,
  );

  factory Bill.fromJson(Map<String, dynamic> json) => _$BillFromJson(json);

  Map<String, dynamic> toJson() => _$BillToJson(this);
}
