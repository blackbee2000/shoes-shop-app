part of 'profile.dart';

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return Profile(
    json['id'] as String?,
    json['fullName'] as String?,
    json['phoneNumber'] as String?,
    json['email'] as String?,
    json['password'] as String?,
    json['role'] as String?,
    json['otp'] as int?,
    json['isDeleted'] as bool?,
    json['createdAt'] as String?,
    json['updatedAt'] as String?,
    json['__v'] as int?,
    json['favourites'] as dynamic,
  );
}

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'password': instance.password,
      'role': instance.role,
      'otp': instance.otp,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.__v,
      'favourites': instance.favourites,
    };
