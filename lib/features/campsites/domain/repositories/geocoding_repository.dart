abstract class GeocodingRepository {
  Future<String> getCityNameFromCoordinates({
    required double latitude,
    required double longitude,
  });
}
