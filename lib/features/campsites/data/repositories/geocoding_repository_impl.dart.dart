import '../../domain/repositories/geocoding_repository.dart';
import '../data_sources/geocoding_local_data_source.dart';

class GeocodingRepositoryImpl implements GeocodingRepository {
  final GeocodingLocalDataSource dataSource;

  GeocodingRepositoryImpl({required this.dataSource});

  @override
  Future<String> getCityNameFromCoordinates({
    required double latitude,
    required double longitude,
  }) async {
    return await dataSource.getCityName(latitude: latitude, longitude: longitude);
  }
}
