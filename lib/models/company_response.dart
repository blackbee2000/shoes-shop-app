import 'package:json_annotation/json_annotation.dart';
import 'package:shoes_shop_app/models/company.dart';
part 'company_response.g.dart';

@JsonSerializable()
class CompanyResponse {
  String? message;
  List<Company>? data;

  CompanyResponse(
    this.message,
    this.data,
  );

  factory CompanyResponse.fromJson(Map<String, dynamic> json) =>
      _$CompanyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyResponseToJson(this);
}
