import 'package:equatable/equatable.dart';

class CampsiteParams extends Equatable {
  final String id;
  final String label;
  final String? cityName;
  final String photo;
  final double latitude;
  final double longitude;
  final bool isCloseToWater;
  final bool isCampFireAllowed;
  final double pricePerNight;
  final List<String> hostLanguages;

  const CampsiteParams({
    required this.id,
    required this.label,
    required this.photo,
    required this.latitude,
    required this.longitude,
    required this.isCloseToWater,
    required this.isCampFireAllowed,
    required this.pricePerNight,
    required this.hostLanguages,
    this.cityName,
  });

  @override
  List<Object?> get props => [
    id, label, photo, latitude, longitude, isCloseToWater,
    isCampFireAllowed, pricePerNight, hostLanguages, cityName
  ];
}
