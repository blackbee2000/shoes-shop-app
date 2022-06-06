import 'package:json_annotation/json_annotation.dart';

part 'paymethod.g.dart';

@JsonSerializable()
class PayMethod {
  String? name;

  PayMethod({
    this.name,
  });

  factory PayMethod.fromJson(Map<String, dynamic> json) =>
      _$PayMethodFromJson(json);
  Map<String, dynamic> toJson() => _$PayMethodToJson(this);
}
