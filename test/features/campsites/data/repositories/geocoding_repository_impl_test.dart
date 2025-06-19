import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:roadsurferdemo/features/campsites/data/repositories/geocoding_repository_impl.dart';
import 'package:roadsurferdemo/features/campsites/domain/entities/geocoding_params.dart';
import 'package:roadsurferdemo/features/campsites/data/data_sources/geocoding_remote_data_source.dart';

import '../../../../test_constants.dart';
import 'geocoding_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GeocodingRemoteDataSource>()])
void main() {
  late MockGeocodingRemoteDataSource mockGeocodingRemoteDataSource;
  late GeocodingRepositoryImpl repository;

  setUp(() {
    mockGeocodingRemoteDataSource = MockGeocodingRemoteDataSource();
    repository = GeocodingRepositoryImpl(
      geocodingDataSource: mockGeocodingRemoteDataSource,
    );
  });

  Future<GeoCodingParams?> prepareAct() async => await repository.getCityNameFromCoordinates(
    latitude: TestConstants.tLat,
    longitude: TestConstants.tLng,
  );

  void verifyCall() => verify(mockGeocodingRemoteDataSource.getLocationComponents(
    lat: TestConstants.tLat,
    long: TestConstants.tLng,
  )).called(1);

  group('getCityNameFromCoordinates', () {
    test('should return GeoCodingParams on success', () async {
      // arrange
      when(mockGeocodingRemoteDataSource.getLocationComponents(
        lat: TestConstants.tLat,
        long: TestConstants.tLng,
      )).thenAnswer((_) async => TestConstants.tGeoCodingModel);

      // act
      final result = await prepareAct();

      // assert
      verifyCall();
      expect(result, TestConstants.tGeoCodingModel);
    });

    test('should return null if data source returns null', () async {
      // arrange
      when(mockGeocodingRemoteDataSource.getLocationComponents(
        lat: TestConstants.tLat,
        long: TestConstants.tLng,
      )).thenAnswer((_) async => null);

      // act
      final result = await prepareAct();

      // assert
      verifyCall();
      expect(result, isNull);
    });

    test('should throw if data source throws', () async {
      // arrange
      when(mockGeocodingRemoteDataSource.getLocationComponents(
        lat: TestConstants.tLat,
        long: TestConstants.tLng,
      )).thenThrow(Exception('API Error'));

      // act
      final result = prepareAct();

      // assert
      expect(() async => await result, throwsException);
      verifyCall();
    });
  });
}
