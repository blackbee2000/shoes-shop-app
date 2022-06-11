part of 'list_cart.dart';

ListCart _$ListCartFromJson(Map<String, dynamic> json) {
  return ListCart(
    json['lstProduct'] == null
        ? null
        : ProductOrder.fromJson(json['lstProduct'] as Map<String, dynamic>),
    json['amount'] as int?,
    json['totalPrice'] as int?,
    json['_id'] as String?,
  );
}

Map<String, dynamic> _$ListCartToJson(ListCart instance) => <String, dynamic>{
      'lstProduct': instance.lstProduct,
      'amount': instance.amount,
      'totalPrice': instance.totalPrice,
      '_id': instance.id,
    };
