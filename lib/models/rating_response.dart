import 'package:json_annotation/json_annotation.dart';
import 'package:shoes_shop_app/models/rating.dart';
part 'rating_response.g.dart';

@JsonSerializable()
class RatingResponse {
  String? message;
  Rating? data;

  RatingResponse(
    this.message,
    this.data,
  );

  factory RatingResponse.fromJson(Map<String, dynamic> json) =>
      _$RatingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RatingResponseToJson(this);
}
