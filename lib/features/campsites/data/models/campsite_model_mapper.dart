import '../../domain/entities/campsite_params.dart';
import 'campsite_model.dart';

extension CampsiteModelMapper on CampsiteModel {
  CampsiteParams toEntity({
    String? cityName,
    required double latitude,
    required double longitude,
    required double pricePerNight,
    String? countryName,
    required DateTime createdAt,
    required String newUrl,
  }) {
    return CampsiteParams(
      id: id,
      label: label,
      photo: newUrl,
      latitude: latitude,
      longitude: longitude,
      isCloseToWater: isCloseToWater,
      isCampFireAllowed: isCampFireAllowed,
      pricePerNight: pricePerNight,
      hostLanguages: hostLanguages,
      createdAt: createdAt,
    );
  }
}
