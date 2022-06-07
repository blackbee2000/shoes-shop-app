part of 'address.dart';

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
    json['_id'] as String?,
    json['province'] as String?,
    json['district'] as String?,
    json['ward'] as String?,
    json['street'] as String?,
    json['status'] as bool?,
    json['nameReciever'] as String?,
    json['phoneReciever'] as String?,
    json['idAccount'] as String?,
  );
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      '_id': instance.id,
      'province': instance.province,
      'district': instance.district,
      'ward': instance.ward,
      'street': instance.street,
      'status': instance.status,
      'nameReciever': instance.nameReciever,
      'phoneReciever': instance.phoneReciever,
      'idAccount': instance.idAccount,
    };
Map<String, dynamic> _$AddressRequestToJson(AddressRequest instance) =>
    <String, dynamic>{
      'province': instance.province,
      'district': instance.district,
      'ward': instance.ward,
      'street': instance.street,
      'status': instance.status,
      'nameReciever': instance.nameReciever,
      'phoneReciever': instance.phoneReciever
    };
