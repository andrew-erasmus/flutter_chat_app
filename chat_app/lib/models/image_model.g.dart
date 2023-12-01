// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PixelfordImage _$PixelfordImageFromJson(Map<String, dynamic> json) =>
    PixelfordImage(
      id: json['id'] as String,
      title: json['title'] as String?,
      filename: json['filename'] as String,
      urlSmallSize: json['urlSmallSize'] as String,
      urlFullSize: json['urlFullSize'] as String,
    );

Map<String, dynamic> _$PixelfordImageToJson(PixelfordImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'filename': instance.filename,
      'title': instance.title,
      'urlFullSize': instance.urlFullSize,
      'urlSmallSize': instance.urlSmallSize,
    };
