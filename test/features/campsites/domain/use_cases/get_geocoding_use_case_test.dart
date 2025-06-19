import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:roadsurferdemo/features/campsites/domain/entities/geocoding_params.dart';
import 'package:roadsurferdemo/features/campsites/domain/repositories/geocoding_repository.dart';
import 'package:roadsurferdemo/features/campsites/domain/use_cases/get_geocoding_use_case.dart';

import '../../../../test_constants.dart';
import 'get_geocoding_use_case_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GeocodingRepository>()])
void main() {
  late GetGeocodingCase useCase;
  late MockGeocodingRepository mockRepository;

  setUp(() {
    mockRepository = MockGeocodingRepository();
    useCase = GetGeocodingCase(mockRepository);
  });

  Future<GeoCodingParams?> prepareAct() async => await useCase(
    lat: TestConstants.tLat,
    long: TestConstants.tLng,
  );

  void verifyCall() {
    verify(mockRepository.getCityNameFromCoordinates(
      latitude: TestConstants.tLat,
      longitude: TestConstants.tLng,
    )).called(1);
    verifyNoMoreInteractions(mockRepository);
  }

  group('GetGeocodingCase', () {
    test('should return GeoCodingParams on success', () async {
      // arrange
      when(mockRepository.getCityNameFromCoordinates(
        latitude: TestConstants.tLat,
        longitude: TestConstants.tLng,
      )).thenAnswer((_) async => TestConstants.tGeoCodingModel);

      // act
      final result = await prepareAct();

      // assert
      verifyCall();
      expect(result, TestConstants.tGeoCodingModel);
    });

    test('should return null if repository returns null', () async {
      // arrange
      when(mockRepository.getCityNameFromCoordinates(
        latitude: TestConstants.tLat,
        longitude: TestConstants.tLng,
      )).thenAnswer((_) async => null);

      // act
      final result = await prepareAct();

      // assert
      verifyCall();
      expect(result, isNull);
    });

    test('should throw if repository throws', () async {
      // arrange
      when(mockRepository.getCityNameFromCoordinates(
        latitude: TestConstants.tLat,
        longitude: TestConstants.tLng,
      )).thenThrow(Exception('Something went wrong'));

      // act & assert
      expect(() async => await prepareAct(), throwsException);
      verifyCall();
    });
  });
}
