import 'package:json_annotation/json_annotation.dart';
part 'company.g.dart';

@JsonSerializable()
class Company {
  String? id;
  String? nameCompany;
  String? logoCompany;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? __v;

  Company(
    this.id,
    this.nameCompany,
    this.logoCompany,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.__v,
  );

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}
