part of 'cart_response.dart';

CartResponse _$CartResponseFromJson(Map<String, dynamic> json) {
  return CartResponse(
    json['message'] as String?,
    json['data'] == null
        ? null
        : Cart.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CartResponseToJson(CartResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
