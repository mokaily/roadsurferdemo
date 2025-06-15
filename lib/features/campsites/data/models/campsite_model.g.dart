// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campsite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CampsiteModel _$CampsiteModelFromJson(Map<String, dynamic> json) =>
    CampsiteModel(
      id: json['id'] as String,
      label: json['label'] as String,
      photo: json['photo'] as String,
      geoLocation: GeoLocationModel.fromJson(
          json['geoLocation'] as Map<String, dynamic>),
      isCloseToWater: json['isCloseToWater'] as bool,
      isCampFireAllowed: json['isCampFireAllowed'] as bool,
      hostLanguages: (json['hostLanguages'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      pricePerNight: (json['pricePerNight'] as num).toDouble(),
      suitableFor: (json['suitableFor'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$CampsiteModelToJson(CampsiteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'photo': instance.photo,
      'geoLocation': instance.geoLocation,
      'isCloseToWater': instance.isCloseToWater,
      'isCampFireAllowed': instance.isCampFireAllowed,
      'hostLanguages': instance.hostLanguages,
      'pricePerNight': instance.pricePerNight,
      'suitableFor': instance.suitableFor,
      'createdAt': instance.createdAt,
    };
