import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:roadsurferdemo/features/campsites/domain/entities/campsite_params.dart';
import 'package:roadsurferdemo/features/campsites/domain/repositories/campsite_repository.dart';

import '../../../../test_constants.dart';
import 'campsite_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<CampsiteRepository>()])
void main() {
  late MockCampsiteRepository mockRepository;

  setUp(() {
    mockRepository = MockCampsiteRepository();
  });

  group('CampsiteRepository contract', () {
    test('should return list of CampsiteParams from getAllCampsites()', () async {
      // arrange
      when(mockRepository.getAllCampsites()).thenAnswer((_) async => [TestConstants.tCampsiteParams1]);

      // act
      final result = await mockRepository.getAllCampsites();

      // assert
      expect(result, isA<List<CampsiteParams>>());
      expect(result.length, 1);
      verify(mockRepository.getAllCampsites()).called(1);
    });

    test('should return a CampsiteParams from getCampsiteById()', () async {
      // arrange
      when(mockRepository.getCampsiteById('1')).thenAnswer((_) async => TestConstants.tCampsiteParams1);

      // act
      final result = await mockRepository.getCampsiteById('1');

      // assert
      expect(result, isA<CampsiteParams>());
      verify(mockRepository.getCampsiteById('1')).called(1);
    });

    test('should return null if campsite not found', () async {
      // arrange
      when(mockRepository.getCampsiteById('999')).thenAnswer((_) async => null);

      // act
      final result = await mockRepository.getCampsiteById('999');

      // assert
      expect(result, isNull);
      verify(mockRepository.getCampsiteById('999')).called(1);
    });
  });
}
