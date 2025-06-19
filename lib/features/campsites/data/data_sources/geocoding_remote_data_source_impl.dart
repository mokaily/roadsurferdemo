import 'package:dio/dio.dart';
import 'package:roadsurferdemo/features/campsites/data/models/geocoding_model.dart';
import '../../../../core/utils/helpers.dart';
import 'geocoding_remote_data_source.dart';

class GeocodingRemoteDataSourceImpl implements GeocodingRemoteDataSource {
  final Dio dio;
  final String apiKey;

  GeocodingRemoteDataSourceImpl({required this.dio, required this.apiKey});

  @override
  Future<GeoCodingModel?> getLocationComponents({required double? lat, required double? long}) async {
    double? latitude = lat;
    double? longitude = long;
    bool isValidated = Helpers.validateLatLong(lat: latitude, long: longitude);

    if (!isValidated) {
      if (Helpers.validateLatLong(lat: longitude, long: latitude)) {
        latitude = long;
        longitude = lat;
      } else {
        return null;
      }
    }

    final url = "https://api.geoapify.com/v1/geocode/reverse?lat=$latitude&lon=$longitude&apiKey=$apiKey";

    try {
      final response = await dio.get(url);

      if (response.statusCode == 200 &&
          response.data["features"] != null &&
          response.data["features"].isNotEmpty) {
        final formatted = response.data["features"][0]["properties"];
        return GeoCodingModel.fromJson(formatted);
      } else {
        return null;
      }
    } catch (e, stacktrace) {
      return null;
    }
  }
}
