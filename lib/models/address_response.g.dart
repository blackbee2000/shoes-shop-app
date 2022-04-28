part of 'address_response.dart';

AddressResponse _$AddressResponseFromJson(Map<String, dynamic> json) {
  return AddressResponse(
    json['message'] as String?,
    json['data'] == null
        ? null
        : Address.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AddressResponseToJson(AddressResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
