part of 'blog.dart';

Blog _$BlogFromJson(Map<String, dynamic> json) {
  return Blog(
    json['_id'] as String?,
    json['contentVi'] as String?,
    json['contentEn'] as String?,
    json['time'] as String?,
    json['imageBlog'] as String?,
    json['descriptionShortVi'] as String?,
    json['descriptionShortEn'] as String?,
    json['isDeleted'] as bool?,
    json['createdAt'] as String?,
    json['updatedAt'] as String?,
    json['__v'] as int?,
  );
}

Map<String, dynamic> _$BlogToJson(Blog instance) => <String, dynamic>{
      '_id': instance.id,
      'contentVi': instance.contentVi,
      'contentEn': instance.contentEn,
      'time': instance.time,
      'imageBlog': instance.imageBlog,
      'descriptionShortVi': instance.descriptionShortVi,
      'descriptionShortEn': instance.descriptionShortEn,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.__v,
    };
