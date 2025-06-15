import 'package:json_annotation/json_annotation.dart';
import 'geo_location_model.dart';

part 'campsite_model.g.dart';

@JsonSerializable()
class CampsiteModel {
  final String id;
  final String label;
  final String photo;
  final GeoLocationModel geoLocation;
  final bool isCloseToWater;
  final bool isCampFireAllowed;
  final List<String> hostLanguages;
  final double pricePerNight;
  final List<String> suitableFor;
  final String createdAt;

  CampsiteModel({
    required this.id,
    required this.label,
    required this.photo,
    required this.geoLocation,
    required this.isCloseToWater,
    required this.isCampFireAllowed,
    required this.hostLanguages,
    required this.pricePerNight,
    required this.suitableFor,
    required this.createdAt,
  });

  factory CampsiteModel.fromJson(Map<String, dynamic> json) =>
      _$CampsiteModelFromJson(json);

  Map<String, dynamic> toJson() => _$CampsiteModelToJson(this);
}
