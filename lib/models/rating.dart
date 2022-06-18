import 'package:json_annotation/json_annotation.dart';
part 'rating.g.dart';

@JsonSerializable()
class Rating {
  String? id;
  String? idProduct;
  dynamic rating;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? __v;
  String? idAccount;

  Rating(
    this.id,
    this.idProduct,
    this.rating,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.__v,
    this.idAccount,
  );

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

  Map<String, dynamic> toJson() => _$RatingToJson(this);
}
