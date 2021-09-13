// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Genre.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Genre _$GenreFromJson(Map<String, dynamic> json) {
  return Genre(
    checksum: json['checksum'] as String?,
    createdAt: json['created_at'] as int?,
    updatedAt: json['updated_at'] as int?,
    name: json['name'] as String,
    id: json['id'] as int,
    url: json['url'] as String,
    slug: json['slug'] as String,
  );
}

Map<String, dynamic> _$GenreToJson(Genre instance) => <String, dynamic>{
      'checksum': instance.checksum,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'name': instance.name,
      'id': instance.id,
      'url': instance.url,
      'slug': instance.slug,
    };
