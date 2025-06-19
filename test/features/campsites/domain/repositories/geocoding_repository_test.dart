import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:roadsurferdemo/features/campsites/domain/repositories/geocoding_repository.dart';

import '../../../../test_constants.dart';
import 'geocoding_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GeocodingRepository>()])
void main() {
  late MockGeocodingRepository mockRepository;

  setUp(() {
    mockRepository = MockGeocodingRepository();
  });

  group('GeocodingRepository contract', () {
    // test('should return city name from coordinates', () async {
    //   // arrange
    //   when(
    //     mockRepository.getCityNameFromCoordinates(
    //       latitude: TestConstants.tLat,
    //       longitude: TestConstants.tLng,
    //     ),
    //   ).thenAnswer((_) async => TestConstants.tCityName);
    //
    //   // act
    //   final result = await mockRepository.getCityNameFromCoordinates(
    //     latitude: TestConstants.tLat,
    //     longitude: TestConstants.tLng,
    //   );
    //
    //   // assert
    //   expect(result, TestConstants.tCityName);
    //   verify(
    //     mockRepository.getCityNameFromCoordinates(
    //       latitude: TestConstants.tLat,
    //       longitude: TestConstants.tLng,
    //     ),
    //   ).called(1);
    // });

    test('should throw if an error occurs', () async {
      // arrange
      when(
        mockRepository.getCityNameFromCoordinates(
          latitude: TestConstants.tLat,
          longitude: TestConstants.tLng,
        ),
      ).thenThrow(Exception('Geocoding failed'));

      // act & assert
      expect(
        () async => await mockRepository.getCityNameFromCoordinates(
          latitude: TestConstants.tLat,
          longitude: TestConstants.tLng,
        ),
        throwsException,
      );

      verify(
        mockRepository.getCityNameFromCoordinates(
          latitude: TestConstants.tLat,
          longitude: TestConstants.tLng,
        ),
      ).called(1);
    });
  });
}
