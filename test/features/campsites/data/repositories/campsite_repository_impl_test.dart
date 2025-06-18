import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:roadsurferdemo/features/campsites/data/data_sources/campsite_remote_data_source.dart';
import 'package:roadsurferdemo/features/campsites/data/data_sources/geocoding_remote_data_source.dart';
import 'package:roadsurferdemo/features/campsites/data/repositories/campsite_repository_impl.dart';
import 'package:roadsurferdemo/features/campsites/domain/entities/campsite_params.dart';

import '../../../../test_constants.dart';
import 'campsite_repository_impl_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<CampsiteRemoteDataSource>(),
  MockSpec<GeocodingRemoteDataSource>(),
])
void main() {
  late MockCampsiteRemoteDataSource mockRemoteDataSource;
  late MockGeocodingRemoteDataSource mockGeocodingDataSource;
  late CampsiteRepositoryImpl repositoryImpl;

  setUp(() {
    mockRemoteDataSource = MockCampsiteRemoteDataSource();
    mockGeocodingDataSource = MockGeocodingRemoteDataSource();
    repositoryImpl = CampsiteRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      geocodingDataSource: mockGeocodingDataSource,
    );
  });

  Future<List<CampsiteParams>> prepareActGetAllCampsites() async =>
      await repositoryImpl.getAllCampsites();

  void verifyGetAllCampsites() =>
      verify(mockRemoteDataSource.fetchCampsites()).called(1);

  group('getAllCampsites', () {
    test('should return List<CampsiteParams> on success', () async {
      // arrange
      when(mockRemoteDataSource.fetchCampsites())
          .thenAnswer((_) async => [TestConstants.tCampsiteModel]);

      // act
      final result = await prepareActGetAllCampsites();

      // assert
      verifyGetAllCampsites();
      expect(result, [TestConstants.tCampsiteParams1.copyWith(createdAt: result[0].createdAt)]);
    });

    test('should throw if remote data source throws', () async {
      // arrange
      when(mockRemoteDataSource.fetchCampsites()).thenThrow(Exception('API failed'));

      // act
      final result = prepareActGetAllCampsites();

      // assert
      expect(() async => await result, throwsException);
      verifyGetAllCampsites();
    });
  });

  group('getCampsiteById', () {
    test('should return campsite by id', () async {
      // arrange
      when(mockRemoteDataSource.fetchCampsites())
          .thenAnswer((_) async => [TestConstants.tCampsiteModel]);

      // act
      final result = await repositoryImpl.getCampsiteById('1');

      // assert
      expect(result, TestConstants.tCampsiteParams1.copyWith(createdAt: result?.createdAt));
      verifyGetAllCampsites();
    });

    test('should throw if no campsite with id found', () async {
      // arrange
      when(mockRemoteDataSource.fetchCampsites())
          .thenAnswer((_) async => [TestConstants.tCampsiteModel]);

      // act & assert
      expect(() async => await repositoryImpl.getCampsiteById('999'), throwsStateError);
      verifyGetAllCampsites();
    });
  });
}
