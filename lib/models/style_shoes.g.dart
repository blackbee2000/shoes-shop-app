part of 'style_shoes.dart';

StyleShoes _$StyleShoesFromJson(Map<String, dynamic> json) {
  return StyleShoes(
    name: json['name'] as String?,
    value: json['value'] as String?,
  );
}

Map<String, dynamic> _$StyleShoesToJson(StyleShoes instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };
