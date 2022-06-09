part of 'paymethod.dart';

PayMethod _$PayMethodFromJson(Map<String, dynamic> json) {
  return PayMethod(
    name: json['name'] as String?,
    type: json['type'] as String?,
  );
}

Map<String, dynamic> _$PayMethodToJson(PayMethod instance) => <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
    };
