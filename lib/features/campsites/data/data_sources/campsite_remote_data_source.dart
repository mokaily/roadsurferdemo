import '../models/campsite_model.dart';

abstract class CampsiteRemoteDataSource {
  Future<List<CampsiteModel>> fetchCampsites();
}