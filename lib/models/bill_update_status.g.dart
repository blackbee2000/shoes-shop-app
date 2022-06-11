part of 'bill_update_status.dart';

BillUpdateStatus _$BillUpdateStatusFromJson(Map<String, dynamic> json) {
  return BillUpdateStatus(
    json['message'] as String?,
    json['data'] == null
        ? null
        : Bill.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BillUpdateStatusToJson(BillUpdateStatus instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
