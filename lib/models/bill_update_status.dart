import 'package:json_annotation/json_annotation.dart';
import 'package:shoes_shop_app/models/bill.dart';
part 'bill_update_status.g.dart';

@JsonSerializable()
class BillUpdateStatus {
  String? message;
  Bill? data;

  BillUpdateStatus(
    this.message,
    this.data,
  );

  factory BillUpdateStatus.fromJson(Map<String, dynamic> json) =>
      _$BillUpdateStatusFromJson(json);

  Map<String, dynamic> toJson() => _$BillUpdateStatusToJson(this);
}
