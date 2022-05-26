part of 'profile_response.dart';

ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) {
  return ProfileResponse(
    json['message'] as String?,
    json['data'] == null
        ? null
        : Profile.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProfileResponseToJson(ProfileResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
