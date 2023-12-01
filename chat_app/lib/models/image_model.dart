import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable()
class PixelforImage {
  String id;
  String filename;
  String? title;
  String urlFullSize;
  String urlSmallSize;

  PixelforImage(
      {required this.id,
      this.title,
      required this.filename,
      @JsonKey(name: 'url_small_size') required this.urlSmallSize,
      @JsonKey(name: 'url_full_size') required this.urlFullSize});

  factory PixelforImage.fromJson(Map<String, dynamic> json) =>
      _$PixelforImageFromJson(json);
  Map<String, dynamic> toJson() => _$PixelforImageToJson(this);
}
