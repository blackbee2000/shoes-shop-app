part of 'ward_response.dart';

WardResponse _$WardResponseFromJson(Map<String, dynamic> json) {
  return WardResponse(
    json['status'] as String?,
    json['message'] as String?,
    (json['results'] as List<dynamic>?)
        ?.map((e) => Ward.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$WardResponseToJson(WardResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.results,
    };
