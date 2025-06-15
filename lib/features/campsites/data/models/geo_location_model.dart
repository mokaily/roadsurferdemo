import 'package:json_annotation/json_annotation.dart';

part 'geo_location_model.g.dart';

@JsonSerializable()
class GeoLocationModel {
  final double lat;

  @JsonKey(name: 'long')
  final double lng;

  GeoLocationModel({
    required this.lat,
    required this.lng,
  });

  factory GeoLocationModel.fromJson(Map<String, dynamic> json) =>
      _$GeoLocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$GeoLocationModelToJson(this);
}
