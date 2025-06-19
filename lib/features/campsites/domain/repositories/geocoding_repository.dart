import '../entities/geocoding_params.dart';

abstract class GeocodingRepository {
  Future<GeoCodingParams?> getCityNameFromCoordinates({
    required double? latitude,
    required double? longitude,
  });
}
