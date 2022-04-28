part of 'company_response.dart';

CompanyResponse _$CompanyResponseFromJson(Map<String, dynamic> json) {
  return CompanyResponse(
    json['message'] as String?,
    json['data'] == null
        ? null
        : Company.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CompanyResponseToJson(CompanyResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
