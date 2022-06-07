part of 'voucher_response.dart';

VoucherResponse _$VoucherResponseFromJson(Map<String, dynamic> json) {
  return VoucherResponse(
    json['message'] as String?,
    (json['data'] as List<dynamic>?)
        ?.map((e) => Voucher.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$VoucherResponseToJson(VoucherResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
