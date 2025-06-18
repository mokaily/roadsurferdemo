import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:roadsurferdemo/features/campsites/data/data_sources/campsite_remote_data_source_impl.dart';
import 'package:roadsurferdemo/features/campsites/data/models/campsite_model.dart';

import '../../../../fixtures/fixture_reader.dart';
import '../../../../test_constants.dart';
import 'campsite_remote_data_source_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Dio>()])
void main() {
  late MockDio mockDio;
  late CampsiteRemoteDataSourceImpl dataSource;

  const endpoint = 'https://62ed0389a785760e67622eb2.mockapi.io/spots/v1/campsites';

  setUp(() {
    mockDio = MockDio();
    dataSource = CampsiteRemoteDataSourceImpl(dio: mockDio);
  });

  Future<List<CampsiteModel>> prepareAct() async => await dataSource.fetchCampsites();
  void verifyCall() => verify(mockDio.get(endpoint)).called(1);

  group('fetchCampsites', () {
    test('should return List<CampsiteModel> on success', () async {
      // arrange
      final responseJson = jsonDecode(fixture('campsites/campsites_list_response.json')) as List<dynamic>;

      when(mockDio.get(endpoint)).thenAnswer((_) async => Response(
        requestOptions: RequestOptions(path: endpoint),
        statusCode: 200,
        data: responseJson,
      ));

      // act
      final result = await prepareAct();

      // assert
      verifyCall();
      expect(result.first.toJson(), equals(TestConstants.tCampsiteModel.toJson()));
    });

    test('should throw if Dio fails', () async {
      // arrange
      when(mockDio.get(endpoint)).thenThrow(DioException(
        requestOptions: RequestOptions(path: endpoint),
        error: 'Failed to connect',
        type: DioErrorType.badResponse,
        response: Response(
          requestOptions: RequestOptions(path: endpoint),
          statusCode: 500,
          statusMessage: 'Internal Server Error',
        ),
      ));

      // act
      final call = dataSource.fetchCampsites;

      // assert
      expect(() async => await call(), throwsA(isA<DioError>()));
      verifyCall();
    });
  });
}
