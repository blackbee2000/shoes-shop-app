part of 'auth_data.dart';

AuthData _$AuthDataFromJson(Map<String, dynamic> json) {
  return AuthData(
    json['token'] as String?,
    json['role'] as String?,
  );
}

Map<String, dynamic> _$AuthDataToJson(AuthData instance) => <String, dynamic>{
      'id': instance.token,
      'avatar': instance.role,
    };
