part of 'blog_response.dart';

BlogResponse _$BlogResponseFromJson(Map<String, dynamic> json) {
  return BlogResponse(
    json['message'] as String?,
    (json['data'] as List<dynamic>?)
        ?.map((e) => Blog.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$BlogResponseToJson(BlogResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
