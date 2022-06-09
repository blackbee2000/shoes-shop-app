part of 'province.dart';

Province _$ProvinceFromJson(Map<String, dynamic> json) {
  return Province(
    json['name'] as String?,
    json['code'] as String?,
  );
}

Map<String, dynamic> _$ProvinceToJson(Province instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
    };
