import 'package:json_annotation/json_annotation.dart';
import 'package:shoes_shop_app/models/otp.dart';
part 'otp_submit.g.dart';

@JsonSerializable()
class OtpSubmit {
  String? message;
  dynamic data;

  OtpSubmit(this.message, this.data);

  factory OtpSubmit.fromJson(Map<String, dynamic> json) =>
      _$OtpSubmitFromJson(json);

  Map<String, dynamic> toJson() => _$OtpSubmitToJson(this);
}
