import 'package:json_annotation/json_annotation.dart';

part 'Genre.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Genre {
  String? checksum;
  int? createdAt;
  int? updatedAt;
  String name;
  int id;
  String url;
  String slug;

  Genre({
    this.checksum,
    this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.id,
    required this.url,
    required this.slug,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
  Map<String, dynamic> toJson() => _$GenreToJson(this);
}
