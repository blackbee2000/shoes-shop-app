part of 'address_delete.dart';

AddressDelete _$AddressDeleteFromJson(Map<String, dynamic> json) {
  return AddressDelete(
    json['message'] as String?,
    json['data'] == null
        ? null
        : Address.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AddressDeleteToJson(AddressDelete instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
