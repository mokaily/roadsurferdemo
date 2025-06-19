import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:roadsurferdemo/features/campsites/domain/entities/filter_params.dart';
import 'package:roadsurferdemo/features/campsites/domain/use_cases/get_all_campsites_use_case.dart';
import 'package:roadsurferdemo/features/campsites/domain/use_cases/get_geocoding_use_case.dart';
import 'package:roadsurferdemo/features/campsites/presentation/providers/state/campsite_notifier.dart';
import 'package:roadsurferdemo/features/campsites/presentation/providers/state/campsite_state.dart';
import 'package:state_notifier_test/state_notifier_test.dart';

import '../../../test_constants.dart';
import 'campsite_notifier_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<GetAllCampsitesUseCase>(),
  MockSpec<GetGeocodingCase>(),
])
void main() {
  late MockGetAllCampsitesUseCase mockGetAllCampsitesUseCase;
  late MockGetGeocodingCase mockGetGeocodingCase;
  late CampsiteNotifier notifier;

  setUp(() {
    mockGetAllCampsitesUseCase = MockGetAllCampsitesUseCase();
    mockGetGeocodingCase = MockGetGeocodingCase();
    notifier = CampsiteNotifier(
      getAllCampsitesUseCase: mockGetAllCampsitesUseCase,
      getGeocodingCase: mockGetGeocodingCase,
    );
  });

  group('loadCampsites', () {
    stateNotifierTest<CampsiteNotifier, CampsiteState>(
      'should emit [loading, filterInitiating, filterInitiating, success] when data loads successfully',
      build: () => notifier,
      setUp: () {
        when(mockGetAllCampsitesUseCase())
            .thenAnswer((_) async => [TestConstants.tCampsiteParams1]);
      },
      actions: (notifier) => notifier.loadCampsites(),
      expect: () => [
        const CampsiteState.loading(),
        isA<FilterInitiating>().having((s) => s.filterParams.availableLanguages, 'availableLanguages', isNotEmpty),
        isA<FilterInitiating>().having((s) => s.filterParams.highestPricePerNight, 'price', isNotNull),
        CampsiteState.success(campsites: [TestConstants.tCampsiteParams1]),
      ],
    );

    stateNotifierTest<CampsiteNotifier, CampsiteState>(
      'should emit [loading, error] when use case throws',
      build: () => notifier,
      setUp: () {
        when(mockGetAllCampsitesUseCase()).thenThrow(Exception('Failed'));
      },
      actions: (notifier) => notifier.loadCampsites(),
      expect: () => [
        const CampsiteState.loading(),
        isA<CampsiteState>().having((s) => s is ErrorState, 'is error', true),
      ],
    );
  });

  group('getCampAddress', () {
    stateNotifierTest<CampsiteNotifier, CampsiteState>(
      'should emit [loadingAddress, addressResult] when geocoding is successful',
      build: () => notifier,
      setUp: () {
        when(mockGetGeocodingCase(lat: TestConstants.tLat, long: TestConstants.tLng))
            .thenAnswer((_) async => TestConstants.tGeoCodingModel);
      },
      actions: (notifier) => notifier.getCampAddress(
        lat: TestConstants.tLat,
        long: TestConstants.tLng,
      ),
      expect: () => [
        const CampsiteState.loadingAddress(),
        CampsiteState.addressResult(address: TestConstants.tGeoCodingModel),
      ],
    );

    stateNotifierTest<CampsiteNotifier, CampsiteState>(
      'should emit [loadingAddress, error] when geocoding throws',
      build: () => notifier,
      setUp: () {
        when(mockGetGeocodingCase(lat: anyNamed('lat'), long: anyNamed('long')))
            .thenThrow(Exception('Geo Error'));
      },
      actions: (notifier) => notifier.getCampAddress(lat: 0, long: 0),
      expect: () => [
        const CampsiteState.loadingAddress(),
        isA<CampsiteState>().having((s) => s is ErrorState, 'is error', true),
      ],
    );
  });

  group('searchCampsites', () {
    test('should emit searchResult with filtered campsites if query matches', () async {
      final notifier = CampsiteNotifier(
        getAllCampsitesUseCase: mockGetAllCampsitesUseCase,
        getGeocodingCase: mockGetGeocodingCase,
      );
      notifier.campsites = [TestConstants.tCampsiteParams1];
      final query = TestConstants.tCampsiteParams1.label;

      expectLater(
        notifier.stream,
        emitsInOrder([
          const CampsiteState.searchLoading(),
          CampsiteState.searchResult(campsites: [TestConstants.tCampsiteParams1]),
        ]),
      );

      notifier.searchCampsites(query);
    });
  });

  group('applyFilter', () {
    test('should emit filterLoading and filterResult with filtered campsites', () async {
      final notifier = CampsiteNotifier(
        getAllCampsitesUseCase: mockGetAllCampsitesUseCase,
        getGeocodingCase: mockGetGeocodingCase,
      );
      notifier.campsites = [TestConstants.tCampsiteParams1];

      expectLater(
        notifier.stream,
        emitsInOrder([
          const CampsiteState.filterLoading(),
          isA<CampsiteState>().having((s) => s is FilterResultState, 'is filter result', true),
        ]),
      );

      notifier.applyFilter(FilterParams(hostLanguages: ['en']));
    });
  });

  group('resetFilters', () {
    test('should reset filters and emit filterInitiating and filterResult', () async {
      final notifier = CampsiteNotifier(
        getAllCampsitesUseCase: mockGetAllCampsitesUseCase,
        getGeocodingCase: mockGetGeocodingCase,
      );
      notifier.campsites = [TestConstants.tCampsiteParams1];

      expectLater(
        notifier.stream,
        emitsInOrder([
          isA<CampsiteState>().having((s) => s is FilterInitiating, 'is filter initiating', true),
          isA<CampsiteState>().having((s) => s is FilterResultState, 'is filter result', true),
        ]),
      );

      notifier.resetFilters();
    });
  });
}
