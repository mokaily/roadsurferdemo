// lib/features/campsites/data/repositories/geocoding_repository_impl.dart

import 'package:roadsurferdemo/features/campsites/domain/entities/geocoding_params.dart';
import 'package:roadsurferdemo/features/campsites/domain/repositories/geocoding_repository.dart';
import '../data_sources/geocoding_remote_data_source.dart';
import '../models/geocoding_model.dart';

class GeocodingRepositoryImpl implements GeocodingRepository {
  final GeocodingRemoteDataSource geocodingDataSource;

  GeocodingRepositoryImpl({required this.geocodingDataSource});

  @override
  Future<GeoCodingParams?> getCityNameFromCoordinates({
    required double? latitude,
    required double? longitude,
  }) async {
    final GeoCodingModel? result = await geocodingDataSource.getLocationComponents(
      lat: latitude,
      long: longitude,
    );
    return result;
  }
}
