part of 'tab_oder_status.dart';

TabOrderStatus _$TabOrderStatusFromJson(Map<String, dynamic> json) {
  return TabOrderStatus(
    name: json['name'] as String?,
    code: json['code'] as int?,
    image: json['image'] as String?,
  );
}

Map<String, dynamic> _$TabOrderStatusToJson(TabOrderStatus instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'image': instance.image,
    };
