abstract class GeocodingLocalDataSource {
  Future<String> getCityName({
    required double latitude,
    required double longitude,
  });
}
