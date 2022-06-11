import 'package:json_annotation/json_annotation.dart';
import 'package:shoes_shop_app/models/bill.dart';
part 'bill_response.g.dart';

@JsonSerializable()
class BillResponse {
  String? message;
  List<Bill>? data;

  BillResponse(
    this.message,
    this.data,
  );

  factory BillResponse.fromJson(Map<String, dynamic> json) =>
      _$BillResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BillResponseToJson(this);
}
