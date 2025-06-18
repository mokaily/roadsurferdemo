import 'package:equatable/equatable.dart';

class CampsiteParams extends Equatable {
  final String id;
  final String label;
  String address;
  final String photo;
  final double latitude;
  final double longitude;
  final bool isCloseToWater;
  final bool isCampFireAllowed;
  final double pricePerNight;
  final List<String> hostLanguages;
  final DateTime createdAt;

  CampsiteParams({
    required this.id,
    required this.label,
    required this.photo,
    required this.latitude,
    required this.longitude,
    required this.isCloseToWater,
    required this.isCampFireAllowed,
    required this.pricePerNight,
    required this.hostLanguages,
    required this.createdAt,
    this.address = "",
  });

  @override
  List<Object?> get props => [
    id, label, photo, latitude, longitude, isCloseToWater,
    isCampFireAllowed, pricePerNight, hostLanguages, address, createdAt
  ];

  CampsiteParams copyWith({
    String? id,
    String? label,
    String? address,
    String? photo,
    double? latitude,
    double? longitude,
    bool? isCloseToWater,
    bool? isCampFireAllowed,
    double? pricePerNight,
    List<String>? hostLanguages,
    DateTime? createdAt,
  }) {
    return CampsiteParams(
      id: id ?? this.id,
      label: label ?? this.label,
      address: address ?? this.address,
      photo: photo ?? this.photo,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      isCloseToWater: isCloseToWater ?? this.isCloseToWater,
      isCampFireAllowed: isCampFireAllowed ?? this.isCampFireAllowed,
      pricePerNight: pricePerNight ?? this.pricePerNight,
      hostLanguages: hostLanguages ?? this.hostLanguages,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
