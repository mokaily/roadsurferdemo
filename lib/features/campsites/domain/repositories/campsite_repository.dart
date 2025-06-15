import '../entities/campsite_params.dart';

abstract class CampsiteRepository {
  Future<List<CampsiteParams>> getAllCampsites();
  Future<CampsiteParams?> getCampsiteById(String id);
}