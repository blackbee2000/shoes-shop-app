import 'package:json_annotation/json_annotation.dart';
part 'blog.g.dart';

@JsonSerializable()
class Blog {
  String? id;
  String? contentVi;
  String? contentEn;
  String? time;
  String? imageBlog;
  String? descriptionShortVi;
  String? descriptionShortEn;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? __v;

  Blog(
    this.id,
    this.contentVi,
    this.contentEn,
    this.time,
    this.imageBlog,
    this.descriptionShortVi,
    this.descriptionShortEn,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.__v,
  );

  factory Blog.fromJson(Map<String, dynamic> json) => _$BlogFromJson(json);

  Map<String, dynamic> toJson() => _$BlogToJson(this);
}
