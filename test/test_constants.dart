import 'package:roadsurferdemo/features/campsites/data/models/campsite_model.dart';
import 'package:roadsurferdemo/features/campsites/data/models/geo_location_model.dart';
import 'package:roadsurferdemo/features/campsites/data/models/geocoding_model.dart';
import 'package:roadsurferdemo/features/campsites/domain/entities/campsite_params.dart';
import 'package:roadsurferdemo/features/campsites/domain/entities/filter_params.dart';
import 'package:roadsurferdemo/features/campsites/domain/entities/geocoding_params.dart';
import 'package:roadsurferdemo/features/campsites/domain/enums/campsite_sortby_enums.dart';

class TestConstants {
  static const String tId = "1";

  static const double tLat = 50.0;

  static const double tLng = 20.0;

  static const String apiKey = "test_api_key";

  static const String tUrl = "https://api.geoapify.com/v1/geocode/reverse?lat=$tLat&lon=$tLng&apiKey=$apiKey";

  static const tCityName = 'Munich';

  static final CampsiteModel tCampsiteModel = CampsiteModel(
    id: '1',
    label: 'Mountain View',
    photo: 'https://example.com/photo.jpg',
    geoLocation: tGeoLocationModel,
    isCloseToWater: true,
    isCampFireAllowed: false,
    hostLanguages: ['en', 'de'],
    pricePerNight: 9999.00,
    suitableFor: ['families', 'hikers'],
    createdAt: "2024-01-01T00:00:00.000Z",
  );

  static final CampsiteParams tCampsiteParams1 = CampsiteParams(
    id: '1',
    label: 'Mountain View',
    photo: 'https://example.com/photo.jpg',
    latitude: 50.0,
    longitude: 20.0,
    isCloseToWater: true,
    isCampFireAllowed: false,
    pricePerNight: 99.99,
    hostLanguages: const ['en', 'de'],
    createdAt: DateTime.parse("2024-01-01T00:00:00.000Z"),
  );

  static final CampsiteParams tCampsiteParams2 = CampsiteParams(
    id: '2',
    label: 'Mountain View',
    photo: 'https://example.com/photo.jpg',
    latitude: 45.0,
    longitude: 10.0,
    isCloseToWater: true,
    isCampFireAllowed: false,
    pricePerNight: 99.99,
    hostLanguages: const ['en', 'de'],
    createdAt: DateTime.parse("2024-01-01T00:00:00.000Z"),
    address: 'Test Address',
  );

  static final List<CampsiteParams> tCampsiteParamsList = [tCampsiteParams1, tCampsiteParams2];

  static const FilterParams tFilterParams1 = FilterParams(
    isCloseToWater: true,
    isCampFireAllowed: false,
    minPricePerNight: 50,
    maxPricePerNight: 150,
    lowestMinPricePerNight: 30,
    highestPricePerNight: 200,
    address: 'Berlin',
    hostLanguages: ['en', 'de'],
    availableLanguages: ['en', 'fr'],
    sortBy: CampsiteSortBy.newer,
  );

  static const FilterParams tFilterParams2 = FilterParams(
    isCloseToWater: false,
    isCampFireAllowed: false,
    minPricePerNight: 50,
    maxPricePerNight: 150,
    lowestMinPricePerNight: 30,
    highestPricePerNight: 200,
    address: 'Berlin',
    hostLanguages: ['en', 'de'],
    availableLanguages: ['en', 'fr'],
    sortBy: CampsiteSortBy.newer,
  );

  static const GeoCodingParams tGeoCodingParams1 = GeoCodingParams(city: 'Berlin', country: 'Germany');
  static const GeoCodingParams tGeoCodingParams2 = GeoCodingParams(city: 'Munich', country: 'Germany');

  static final GeoLocationModel tGeoLocationModel = GeoLocationModel(lat: 50.0, lng: 20.0);

  static final GeoCodingModel tGeoCodingModel = GeoCodingModel(city: "Munich", country: "Germany");
}
