part of 'company.dart';

Company _$CompanyFromJson(Map<String, dynamic> json) {
  return Company(
    json['_id'] as String?,
    json['nameCompany'] as String?,
    json['logoCompany'] as String?,
    json['isDeleted'] as bool?,
    json['createdAt'] as String?,
    json['updatedAt'] as String?,
    json['__v'] as int?,
  );
}

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      '_id': instance.id,
      'nameCompany': instance.nameCompany,
      'logoCompany': instance.logoCompany,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.__v,
    };
