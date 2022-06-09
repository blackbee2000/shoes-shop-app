part of 'district_response.dart';

DistrictResponse _$DistrictResponseFromJson(Map<String, dynamic> json) {
  return DistrictResponse(
    json['status'] as String?,
    json['message'] as String?,
    (json['results'] as List<dynamic>?)
        ?.map((e) => District.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$DistrictResponseToJson(DistrictResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.results,
    };
