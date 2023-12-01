import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable()
class PixelfordImage {
  String id;
  String filename;
  String? title;
  String urlFullSize;
  String urlSmallSize;

  PixelfordImage(
      {required this.id,
      this.title,
      required this.filename,
      @JsonKey(name: 'url_small_size') required this.urlSmallSize,
      @JsonKey(name: 'url_full_size') required this.urlFullSize});

  factory PixelfordImage.fromJson(Map<String, dynamic> json) =>
      _$PixelfordImageFromJson(json);
  Map<String, dynamic> toJson() => _$PixelfordImageToJson(this);
}
