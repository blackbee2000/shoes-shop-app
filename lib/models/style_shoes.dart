import 'package:json_annotation/json_annotation.dart';

part 'style_shoes.g.dart';

@JsonSerializable()
class StyleShoes {
  String? name;
  String? value;

  StyleShoes({
    this.name,
    this.value,
  });

  factory StyleShoes.fromJson(Map<String, dynamic> json) =>
      _$StyleShoesFromJson(json);
  Map<String, dynamic> toJson() => _$StyleShoesToJson(this);
}
