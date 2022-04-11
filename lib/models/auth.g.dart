part of 'auth.dart';

Auth _$AuthFromJson(Map<String, dynamic> json) {
  return Auth(
    json['message'] as String?,
    json['data'] == null
        ? null
        : AuthData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AuthToJson(Auth instance) => <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
