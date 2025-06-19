// lib/features/campsites/domain/usecases/get_geocoding_case.dart

import '../entities/geocoding_params.dart';
import '../repositories/geocoding_repository.dart';

class GetGeocodingCase {
  final GeocodingRepository repository;

  GetGeocodingCase(this.repository);

  Future<GeoCodingParams?> call({
    required double? long,
    required double? lat,
  }) async {
    return await repository.getCityNameFromCoordinates(
      longitude: long,
      latitude: lat,
    );
  }
}
