import 'package:json_annotation/json_annotation.dart';
import 'package:shoes_shop_app/models/voucher.dart';
part 'voucher_response.g.dart';

@JsonSerializable()
class VoucherResponse {
  String? message;
  List<Voucher>? data;

  VoucherResponse(
    this.message,
    this.data,
  );

  factory VoucherResponse.fromJson(Map<String, dynamic> json) =>
      _$VoucherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VoucherResponseToJson(this);
}
