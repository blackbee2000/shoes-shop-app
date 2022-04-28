part of 'blog_response.dart';

BlogResponse _$BlogResponseFromJson(Map<String, dynamic> json) {
  return BlogResponse(
    json['message'] as String?,
    json['data'] == null
        ? null
        : Blog.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BlogResponseToJson(BlogResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };
