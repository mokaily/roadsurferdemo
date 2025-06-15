import '../entities/campsite_params.dart';
import '../repositories/campsite_repository.dart';

class GetCampsiteByIdUseCase {
  final CampsiteRepository repository;

  GetCampsiteByIdUseCase(this.repository);

  Future<CampsiteParams?> call(String id) {
    return repository.getCampsiteById(id);
  }
}
