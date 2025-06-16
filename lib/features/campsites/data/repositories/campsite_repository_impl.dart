import '../../../../core/utils/normalizers.dart';
import '../../domain/entities/campsite_params.dart';
import '../../domain/repositories/campsite_repository.dart';
import '../data_sources/campsite_remote_data_source.dart';
import '../data_sources/geocoding_remote_data_source.dart';
import '../models/campsite_model_mapper.dart';

class CampsiteRepositoryImpl implements CampsiteRepository {
  final CampsiteRemoteDataSource remoteDataSource;
  final GeocodingRemoteDataSource geocodingDataSource;

  CampsiteRepositoryImpl({
    required this.remoteDataSource,
    required this.geocodingDataSource,
  });

  @override
  Future<List<CampsiteParams>> getAllCampsites() async {
    final models = await remoteDataSource.fetchCampsites();

    final List<CampsiteParams> enriched = [];
    for (var model in models) {
      double newLatitude = Helpers.normalizeLatLong(model.geoLocation.lat);
      double newLongitude = Helpers.normalizeLatLong(model.geoLocation.lng);
      double newPrice = Helpers.normalizePrice(model.pricePerNight);

      enriched.add(model.toEntity(
          latitude: newLatitude,
          longitude: newLongitude,
          pricePerNight: newPrice));
    }
    return enriched;
  }

  @override
  Future<CampsiteParams?> getCampsiteById(String id) async {
    final all = await getAllCampsites();
    return all.firstWhere((e) => e.id == id);
  }
}
