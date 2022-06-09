part of 'province_response.dart';

ProvinceResponse _$ProvinceResponseFromJson(Map<String, dynamic> json) {
  return ProvinceResponse(
    json['status'] as String?,
    json['message'] as String?,
    (json['results'] as List<dynamic>?)
        ?.map((e) => Province.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ProvinceResponseToJson(ProvinceResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.results,
    };
