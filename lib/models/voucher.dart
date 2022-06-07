import 'package:json_annotation/json_annotation.dart';
part 'voucher.g.dart';

@JsonSerializable()
class Voucher {
  String? id;
  String? title;
  String? voucherCode;
  int? discount;
  int? maxDiscount;
  String? expiry;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? __v;
  String? quantity;

  Voucher(
    this.id,
    this.title,
    this.voucherCode,
    this.discount,
    this.maxDiscount,
    this.expiry,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.__v,
    this.quantity,
  );

  factory Voucher.fromJson(Map<String, dynamic> json) =>
      _$VoucherFromJson(json);

  Map<String, dynamic> toJson() => _$VoucherToJson(this);
}
