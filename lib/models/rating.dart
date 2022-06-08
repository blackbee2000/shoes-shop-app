import 'package:json_annotation/json_annotation.dart';

part 'rating.g.dart';


@JsonSerializable()
class Rating {
  String? id;
  String? idProduct;
  String? idAccount;
  dynamic rating;

  Rating(this.id, this.idProduct, this.idAccount, this.rating);

  factory Rating.fromJson(Map<String, dynamic> json) =>
      _$RatingFromJson(json);

  Map<String, dynamic> toJson() => _$RatingToJson(this);
}
