// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Screenshot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Screenshot _$ScreenshotFromJson(Map<String, dynamic> json) {
  return Screenshot(
    json['checksum'] as String?,
    json['height'] as int,
    json['width'] as int,
    json['id'] as int,
    json['image_id'] as String,
    json['game'] as int,
    json['url'] as String?,
  );
}

Map<String, dynamic> _$ScreenshotToJson(Screenshot instance) =>
    <String, dynamic>{
      'checksum': instance.checksum,
      'id': instance.id,
      'game': instance.game,
      'height': instance.height,
      'width': instance.width,
      'image_id': instance.imageId,
      'url': instance.url,
    };
