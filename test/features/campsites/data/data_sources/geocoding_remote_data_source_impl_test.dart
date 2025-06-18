import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:roadsurferdemo/features/campsites/data/data_sources/geocoding_remote_data_source_impl.dart';
import 'package:roadsurferdemo/features/campsites/data/models/geocoding_model.dart';

import '../../../../fixtures/fixture_reader.dart';
import '../../../../test_constants.dart';
import 'geocoding_remote_data_source_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Dio>()])
void main() {
  late MockDio mockDio;
  late GeocodingRemoteDataSourceImpl dataSource;


  setUp(() {
    mockDio = MockDio();
    dataSource = GeocodingRemoteDataSourceImpl(dio: mockDio, apiKey: TestConstants.apiKey);
  });

  Future<GeoCodingModel?> prepareAct() async =>
      await dataSource.getLocationComponents(lat: TestConstants.tLat, long: TestConstants.tLng);

  void verifyCall() => verify(mockDio.get(TestConstants.tUrl)).called(1);

  group('getLocationComponents', () {
    test('should return GeoCodingModel on valid response', () async {
      // arrange
      final responseJson =
      jsonDecode(fixture('campsites/geocoding_response.json'));

      when(mockDio.get(TestConstants.tUrl)).thenAnswer((_) async => Response(
        requestOptions: RequestOptions(path: TestConstants.tUrl),
        statusCode: 200,
        data: responseJson,
      ));

      // act
      final result = await prepareAct();

      // assert
      verifyCall();
      expect(result, equals(TestConstants.tGeoCodingModel));
    });

    test('should return null on invalid coordinates', () async {
      // act
      final result = await dataSource.getLocationComponents(lat: 9999, long: 9999);

      // assert
      expect(result, isNull);
      verifyNever(mockDio.get(any));
    });

    test('should return null if response status is not 200', () async {
      // arrange
      when(mockDio.get(TestConstants.tUrl)).thenAnswer((_) async => Response(
        requestOptions: RequestOptions(path: TestConstants.tUrl),
        statusCode: 400,
        data: {},
      ));

      // act
      final result = await prepareAct();

      // assert
      verifyCall();
      expect(result, isNull);
    });

    test('should return null if Dio throws', () async {
      // arrange
      when(mockDio.get(TestConstants.tUrl)).thenThrow(Exception('Request failed'));

      // act
      final result = await prepareAct();

      // assert
      verifyCall();
      expect(result, isNull);
    });
  });
}
