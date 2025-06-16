import '../../domain/entities/campsite_params.dart';
import 'campsite_model.dart';

extension CampsiteModelMapper on CampsiteModel {
  CampsiteParams toEntity({String? cityName, required double latitude, required double longitude, required double pricePerNight, String? countryName}) {
    return CampsiteParams(
      id: id,
      label: label,
      photo: photo,
      latitude: latitude,
      longitude: longitude,
      isCloseToWater: isCloseToWater,
      isCampFireAllowed: isCampFireAllowed,
      pricePerNight: pricePerNight,
      hostLanguages: hostLanguages,
    );
  }
}
