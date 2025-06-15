// lib/features/campsites/data/datasources/geocoding_local_data_source_impl.dart

import 'package:geocoding/geocoding.dart';
import 'geocoding_local_data_source.dart';

class GeocodingLocalDataSourceImpl implements GeocodingLocalDataSource {
  @override
  Future<String> getCityName({
    required double latitude,
    required double longitude,
  }) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);

      if (placemarks.isNotEmpty) {
        return placemarks.first.locality ?? placemarks.first.administrativeArea ?? 'Unknown';
      } else {
        return 'Unknown';
      }
    } catch (e) {
      // You can log or handle errors better here
      return 'Unknown';
    }
  }
}
