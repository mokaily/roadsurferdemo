import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadsurferdemo/features/campsites/domain/use_cases/get_all_campsites_use_case.dart';
import '../../../../core/providers/dio_provider.dart';
import 'features/campsites/data/data_sources/campsite_remote_data_source.dart';
import 'features/campsites/data/data_sources/campsite_remote_data_source_impl.dart';
import 'features/campsites/data/data_sources/geocoding_local_data_source.dart';
import 'features/campsites/data/data_sources/geocoding_local_data_source_impl.dart';
import 'features/campsites/data/repositories/campsite_repository_impl.dart';
import 'features/campsites/data/repositories/geocoding_repository_impl.dart.dart';
import 'features/campsites/domain/repositories/campsite_repository.dart';
import 'features/campsites/domain/repositories/geocoding_repository.dart';
import 'features/campsites/presentation/providers/state/campsite_notifier.dart';
import 'features/campsites/presentation/providers/state/campsite_state.dart';

// Datasources Providers
final campsiteRemoteDataSourceProvider = Provider<CampsiteRemoteDataSource>((ref) {
  return CampsiteRemoteDataSourceImpl(dio: ref.watch(dioProvider));
});

final geocodingRemoteDataSourceProvider = Provider<GeocodingLocalDataSource>((ref) {
  return GeocodingLocalDataSourceImpl();
});

// Repositories Providers
final campsiteRepositoryProvider = Provider<CampsiteRepository>((ref) {
  return CampsiteRepositoryImpl(
    remoteDataSource: ref.watch(campsiteRemoteDataSourceProvider),
    geocodingDataSource: ref.watch(geocodingRemoteDataSourceProvider),
  );
});

final geocodingRepositoryProvider = Provider<GeocodingRepository>((ref) {
  return GeocodingRepositoryImpl(
    dataSource: ref.watch(geocodingRemoteDataSourceProvider),
  );
});

// UseCases providers
final getAllCampsitesProvider = Provider<GetAllCampsitesUseCase>((ref) {
  return GetAllCampsitesUseCase(ref.watch(campsiteRepositoryProvider));
});


// Notifiers Providers
final campsiteNotifierProvider = StateNotifierProvider<CampsiteNotifier, CampsiteState>(
  (ref) {
    return CampsiteNotifier(
      getAllCampsitesUseCase: ref.watch(getAllCampsitesProvider),
    );
  },
);

