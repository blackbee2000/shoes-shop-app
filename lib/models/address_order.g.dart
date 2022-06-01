part of 'address_order.dart';

AddressOrder _$AddressOrderFromJson(Map<String, dynamic> json) {
  return AddressOrder(
    json['_id'] as String?,
    json['district'] as String?,
    json['ward'] as String?,
    json['street'] as String?,
    json['status'] as bool?,
    json['nameReciever'] as String?,
    json['phoneReciever'] as String?,
  );
}

Map<String, dynamic> _$AddressOrderToJson(AddressOrder instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'district': instance.district,
      'ward': instance.ward,
      'street': instance.street,
      'status': instance.status,
      'nameReciever': instance.nameReciever,
      'phoneReciever': instance.phoneReciever,
    };
