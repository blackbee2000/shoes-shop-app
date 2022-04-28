part of 'order_response.dart';

OrderResponse _$OrderResponseFromJson(Map<String, dynamic> json) {
  return OrderResponse(
    json['message'] as String?,
    json['data'] == null
        ? null
        : Order.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OrderResponseToJson(OrderResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
