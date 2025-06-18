import 'package:roadsurferdemo/features/campsites/data/models/geocoding_model.dart';

abstract class GeocodingRemoteDataSource {
  Future<GeoCodingModel?> getLocationComponents({required double lat, required double long});
}