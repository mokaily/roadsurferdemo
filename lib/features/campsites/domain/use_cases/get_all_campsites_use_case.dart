import '../entities/campsite_params.dart';
import '../repositories/campsite_repository.dart';

class GetAllCampsitesUseCase {
  final CampsiteRepository repository;

  GetAllCampsitesUseCase(this.repository);

  Future<List<CampsiteParams>> call() {
    return repository.getAllCampsites();
  }
}
