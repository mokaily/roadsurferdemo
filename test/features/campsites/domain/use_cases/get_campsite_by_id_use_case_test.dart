import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:roadsurferdemo/features/campsites/domain/entities/campsite_params.dart';
import 'package:roadsurferdemo/features/campsites/domain/repositories/campsite_repository.dart';
import 'package:roadsurferdemo/features/campsites/domain/use_cases/get_campsite_by_id_use_case.dart';

import '../../../../test_constants.dart';
import 'get_campsite_by_id_use_case_test.mocks.dart';

@GenerateNiceMocks([MockSpec<CampsiteRepository>()])
void main() {
  late GetCampsiteByIdUseCase useCase;
  late MockCampsiteRepository mockRepository;

  setUp(() {
    mockRepository = MockCampsiteRepository();
    useCase = GetCampsiteByIdUseCase(mockRepository);
  });

  Future<CampsiteParams?> prepareAct() async => await useCase(TestConstants.tId);

  void verifyCall() {
    verify(mockRepository.getCampsiteById(TestConstants.tId)).called(1);
    verifyNoMoreInteractions(mockRepository);
  }

  group('GetCampsiteByIdUseCase', () {
    test('should return campsite when found', () async {
      // arrange
      when(
        mockRepository.getCampsiteById(TestConstants.tId),
      ).thenAnswer((_) async => TestConstants.tCampsiteParams1);

      // act
      final result = await prepareAct();

      // assert
      verifyCall();
      expect(result, TestConstants.tCampsiteParams1);
    });

    test('should return null when campsite not found', () async {
      // arrange
      when(mockRepository.getCampsiteById(TestConstants.tId)).thenAnswer((_) async => null);

      // act
      final result = await prepareAct();

      // assert
      verifyCall();
      expect(result, null);
    });

    test('should throw if repository throws', () async {
      // arrange
      when(mockRepository.getCampsiteById(TestConstants.tId)).thenThrow(Exception('boom'));

      // act & assert
      expect(() async => await prepareAct(), throwsException);
      verifyCall();
    });
  });
}
