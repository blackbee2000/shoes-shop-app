part of 'district.dart';

District _$DistrictFromJson(Map<String, dynamic> json) {
  return District(
    json['name'] as String?,
    json['code'] as String?,
    json['province'] as String?,
  );
}

Map<String, dynamic> _$DistrictToJson(District instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'province': instance.province,
    };
