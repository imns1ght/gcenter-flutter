import 'package:json_annotation/json_annotation.dart';

part 'Screenshot.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Screenshot {
  String? checksum;
  int id;
  int game;
  int height;
  int width;
  String imageId;
  String? url;

  Screenshot(this.checksum, this.height, this.width, this.id, this.imageId,
      this.game, this.url);

  factory Screenshot.fromJson(Map<String, dynamic> json) =>
      _$ScreenshotFromJson(json);
  Map<String, dynamic> toJson() => _$ScreenshotToJson(this);
}
