import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:roadsurferdemo/features/campsites/domain/entities/campsite_params.dart';
import 'package:roadsurferdemo/features/campsites/domain/repositories/campsite_repository.dart';
import 'package:roadsurferdemo/features/campsites/domain/use_cases/get_all_campsites_use_case.dart';

import '../../../../test_constants.dart';
import 'get_all_campsites_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<CampsiteRepository>()])
void main() {
  late GetAllCampsitesUseCase useCase;
  late MockCampsiteRepository mockRepository;

  setUp(() {
    mockRepository = MockCampsiteRepository();
    useCase = GetAllCampsitesUseCase(mockRepository);
  });

  Future<List<CampsiteParams>> prepareAct() async => await useCase();

  void verifyCall() {
    verify(mockRepository.getAllCampsites()).called(1);
    verifyNoMoreInteractions(mockRepository);
  }

  group('GetAllCampsitesUseCase', () {
    test('should return list of campsites', () async {
      // arrange
      when(mockRepository.getAllCampsites()).thenAnswer((_) async => TestConstants.tCampsiteParamsList);

      // act
      final result = await prepareAct();

      // assert
      verifyCall();
      expect(result, TestConstants.tCampsiteParamsList);
    });

    test('should throw if repository throws', () async {
      // arrange
      when(mockRepository.getAllCampsites()).thenThrow(Exception('Something went wrong'));

      // act
      expect(() async => await prepareAct(), throwsException);

      // assert
      verifyCall();
    });
  });
}
