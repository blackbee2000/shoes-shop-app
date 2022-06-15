part of 'rating_response.dart';

RatingResponse _$RatingResponseFromJson(Map<String, dynamic> json) {
  return RatingResponse(
    json['message'] as String?,
    json['data'] == null
        ? null
        : Rating.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RatingResponseToJson(RatingResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
