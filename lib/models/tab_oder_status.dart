import 'package:json_annotation/json_annotation.dart';

part 'tab_order_status.g.dart';

@JsonSerializable()
class TabOrderStatus {
  String? name;
  int? code;
  String? image;

  TabOrderStatus({
    this.name,
    this.code,
    this.image,
  });

  factory TabOrderStatus.fromJson(Map<String, dynamic> json) =>
      _$TabOrderStatusFromJson(json);
  Map<String, dynamic> toJson() => _$TabOrderStatusToJson(this);
}
