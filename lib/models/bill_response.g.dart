part of 'bill_response.dart';

BillResponse _$BillResponseFromJson(Map<String, dynamic> json) {
  return BillResponse(
    json['message'] as String?,
    (json['data'] as List<dynamic>?)
        ?.map((e) => Bill.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$BillResponseToJson(BillResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
