// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geocoding_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeoCodingModel _$GeoCodingModelFromJson(Map<String, dynamic> json) =>
    GeoCodingModel(
      country: json['country'] as String,
      city: json['city'] as String,
    );

Map<String, dynamic> _$GeoCodingModelToJson(GeoCodingModel instance) =>
    <String, dynamic>{'city': instance.city, 'country': instance.country};
