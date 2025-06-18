// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeoLocationModel _$GeoLocationModelFromJson(Map<String, dynamic> json) =>
    GeoLocationModel(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['long'] as num).toDouble(),
    );

Map<String, dynamic> _$GeoLocationModelToJson(GeoLocationModel instance) =>
    <String, dynamic>{'lat': instance.lat, 'long': instance.lng};
