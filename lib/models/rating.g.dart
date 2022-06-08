part of 'rating.dart';

Rating _$RatingFromJson(Map<String, dynamic> json) {
  return Rating(
    json['_id'] as String?,
    json['idProduct'] as String?,
    json['idAccount'] as String?,
    json['rating'] as dynamic,
  );
}

Map<String, dynamic> _$RatingToJson(Rating instance) => <String, dynamic>{
      '_id': instance.id,
      'idProduct': instance.idProduct,
      'idAccount': instance.idAccount,
      'rating': instance.rating,
    };
