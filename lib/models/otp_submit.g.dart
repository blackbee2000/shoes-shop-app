part of 'otp_submit.dart';

OtpSubmit _$OtpSubmitFromJson(Map<String, dynamic> json) {
  return OtpSubmit(
    json['message'] as String?,
    json['data'] as dynamic,
  );
}

Map<String, dynamic> _$OtpSubmitToJson(OtpSubmit instance) => <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
