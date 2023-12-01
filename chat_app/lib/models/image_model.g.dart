// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PixelforImage _$PixelforImageFromJson(Map<String, dynamic> json) =>
    PixelforImage(
      id: json['id'] as String,
      title: json['title'] as String?,
      filename: json['filename'] as String,
      urlSmallSize: json['urlSmallSize'] as String,
      urlFullSize: json['urlFullSize'] as String,
    );

Map<String, dynamic> _$PixelforImageToJson(PixelforImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'filename': instance.filename,
      'title': instance.title,
      'urlFullSize': instance.urlFullSize,
      'urlSmallSize': instance.urlSmallSize,
    };
