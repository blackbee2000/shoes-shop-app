part of 'rating.dart';

Rating _$RatingFromJson(Map<String, dynamic> json) {
  return Rating(
    json['_id'] as String?,
    json['idProduct'] as String?,
    json['rating'] as double?,
    json['isDeleted'] as bool?,
    json['createdAt'] as String?,
    json['updatedAt'] as String?,
    json['__v'] as int?,
    json['idAccount'] as String?,
  );
}

Map<String, dynamic> _$RatingToJson(Rating instance) => <String, dynamic>{
      '_id': instance.id,
      'idProduct': instance.idProduct,
      'rating': instance.rating,
      'idAccount': instance.idAccount,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.__v,
    };
