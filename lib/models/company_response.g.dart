part of 'company_response.dart';

CompanyResponse _$CompanyResponseFromJson(Map<String, dynamic> json) {
  return CompanyResponse(
    json['message'] as String?,
    (json['data'] as List<dynamic>?)
        ?.map((e) => Company.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CompanyResponseToJson(CompanyResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
