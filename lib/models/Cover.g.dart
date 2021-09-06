// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Cover.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cover _$CoverFromJson(Map<String, dynamic> json) {
  return Cover(
    json['alpha_channel'] as bool?,
    json['animated'] as bool?,
    json['checksum'] as String?,
    json['height'] as int?,
    json['width'] as int?,
    json['id'] as int,
    json['image_id'] as String,
    json['game'] as int?,
    json['url'] as String?,
  );
}

Map<String, dynamic> _$CoverToJson(Cover instance) => <String, dynamic>{
      'alpha_channel': instance.alphaChannel,
      'animated': instance.animated,
      'checksum': instance.checksum,
      'height': instance.height,
      'width': instance.width,
      'id': instance.id,
      'image_id': instance.imageId,
      'game': instance.game,
      'url': instance.url,
    };
