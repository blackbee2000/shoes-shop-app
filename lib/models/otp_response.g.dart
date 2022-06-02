part of 'otp_response.dart';

OtpResponse _$OtpResponseFromJson(Map<String, dynamic> json) {
  return OtpResponse(
    json['message'] as String?,
    json['body'] == null
        ? null
        : Otp.fromJson(json['body'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OtpResponseToJson(OtpResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'body': instance.body,
    };
