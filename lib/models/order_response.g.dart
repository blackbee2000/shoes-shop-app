part of 'order_response.dart';

OrderResponse _$OrderResponseFromJson(Map<String, dynamic> json) {
  return OrderResponse(
    json['message'] as String?,
    (json['data'] as List<dynamic>?)
        ?.map((e) => Order.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$OrderResponseToJson(OrderResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
