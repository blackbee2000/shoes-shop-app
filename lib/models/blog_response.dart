import 'package:json_annotation/json_annotation.dart';
import 'package:shoes_shop_app/models/blog.dart';
part 'blog_response.g.dart';

@JsonSerializable()
class BlogResponse {
  String? message;
  List<Blog>? data;

  BlogResponse(
    this.message,
    this.data,
  );

  factory BlogResponse.fromJson(Map<String, dynamic> json) =>
      _$BlogResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BlogResponseToJson(this);
}
