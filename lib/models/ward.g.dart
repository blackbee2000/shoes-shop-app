part of 'ward.dart';

Ward _$WardFromJson(Map<String, dynamic> json) {
  return Ward(
    json['name'] as String?,
    json['code'] as String?,
    json['district'] as String?,
    json['province'] as String?,
  );
}

Map<String, dynamic> _$WardToJson(Ward instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'district': instance.district,
      'province': instance.province,
    };
