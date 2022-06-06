part of 'cart_list.dart';

CartList _$CartListFromJson(Map<String, dynamic> json) {
  return CartList(
    json['message'] as String?,
    (json['data'] as List<dynamic>?)
        ?.map((e) => Cart.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CartListToJson(CartList instance) => <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
