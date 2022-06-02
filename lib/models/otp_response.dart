import 'package:json_annotation/json_annotation.dart';
import 'package:shoes_shop_app/models/otp.dart';
part 'otp_response.g.dart';

@JsonSerializable()
class OtpResponse {
  String? message;
  Otp? body;

  OtpResponse(this.message, this.body);

  factory OtpResponse.fromJson(Map<String, dynamic> json) =>
      _$OtpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OtpResponseToJson(this);
}
