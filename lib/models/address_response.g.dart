part of 'address_response.dart';

AddressResponse _$AddressResponseFromJson(Map<String, dynamic> json) {
  return AddressResponse(
    json['message'] as String?,
    (json['data'] as List<dynamic>?)
        ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$AddressResponseToJson(AddressResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
OneAddressResponse _$OneAddressResponseFromJson(Map<String, dynamic> json) {
  return OneAddressResponse(
    json['message'] as String?,
    json['data'] == null
        ? null
        : Address.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OneAddressResponseToJson(OneAddressResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
