part of 'register_response.dart';

RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) {
  return RegisterResponse(
    json['message'] as String?,
    json['data'] == null
        ? null
        : Profile.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RegisterResponseToJson(RegisterResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
