import '../../domain/entities/campsite_params.dart';
import '../../domain/repositories/campsite_repository.dart';
import '../data_sources/campsite_remote_data_source.dart';
import '../data_sources/geocoding_local_data_source.dart';
import '../models/campsite_model_mapper.dart';

class CampsiteRepositoryImpl implements CampsiteRepository {
  final CampsiteRemoteDataSource remoteDataSource;
  final GeocodingLocalDataSource geocodingDataSource;

  CampsiteRepositoryImpl({
    required this.remoteDataSource,
    required this.geocodingDataSource,
  });

  @override
  Future<List<CampsiteParams>> getAllCampsites() async {
    final models = await remoteDataSource.fetchCampsites();

    final List<CampsiteParams> enriched = [];
    for (var model in models) {
      final city = await geocodingDataSource.getCityName(
        latitude: model.geoLocation.lat,
        longitude: model.geoLocation.lng,
      );
      enriched.add(model.toEntity(cityName: city));
    }
    return enriched;
  }

  @override
  Future<CampsiteParams?> getCampsiteById(String id) async {
    final all = await getAllCampsites();
    return all.firstWhere((e) => e.id == id);
  }
}
