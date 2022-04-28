part of 'address.dart';

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
    json['_id'] as String?,
    json['district'] as String?,
    json['ward'] as String?,
    json['street'] as String?,
    json['status'] as bool?,
    json['nameReciever'] as String?,
    json['phoneReciever'] as String?,
    json['isDeleted'] as bool?,
    json['createdAt'] as String?,
    json['updatedAt'] as String?,
    json['__v'] as int?,
    json['idAccount'] as String?,
  );
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      '_id': instance._id,
      'district': instance.district,
      'ward': instance.ward,
      'street': instance.street,
      'status': instance.status,
      'nameReciever': instance.nameReciever,
      'phoneReciever': instance.phoneReciever,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.__v,
      'idAccount': instance.idAccount,
    };
