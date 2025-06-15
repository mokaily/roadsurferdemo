import '../../domain/entities/campsite_params.dart';
import 'campsite_model.dart';

extension CampsiteModelMapper on CampsiteModel {
  CampsiteParams toEntity({String? cityName}) {
    return CampsiteParams(
      id: id,
      label: label,
      photo: photo,
      latitude: geoLocation.lat,
      longitude: geoLocation.lng,
      isCloseToWater: isCloseToWater,
      isCampFireAllowed: isCampFireAllowed,
      pricePerNight: pricePerNight,
      hostLanguages: hostLanguages,
      cityName: cityName,
    );
  }
}
