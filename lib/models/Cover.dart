import 'package:json_annotation/json_annotation.dart';

part 'Cover.g.dart';

// enum Size {
//   cover_small,
//   screenshot_med,
//   cover_big,
//   logo_med,
//   screenshot_big,
//   screenshot_huge,
//   thumb,
//   micro,
//   fullhd,
// }

@JsonSerializable(fieldRename: FieldRename.snake)
class Cover {
  bool? alphaChannel;
  bool? animated;
  String? checksum;
  int? height;
  int? width;
  int id;
  String imageId;
  int? game;
  String? url;

  Cover(this.alphaChannel, this.animated, this.checksum, this.height,
      this.width, this.id, this.imageId, this.game, this.url);

  factory Cover.fromJson(Map<String, dynamic> json) => _$CoverFromJson(json);
  Map<String, dynamic> toJson() => _$CoverToJson(this);
}
