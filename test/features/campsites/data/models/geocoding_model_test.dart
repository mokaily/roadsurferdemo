import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:roadsurferdemo/features/campsites/data/models/geo_location_model.dart';
import 'package:roadsurferdemo/features/campsites/data/models/geocoding_model.dart';

import '../../../../fixtures/fixture_reader.dart';
import '../../../../test_constants.dart';

void main() {
  group('GeoCodingModel', () {
    test('Should be a subclass of GeoCodingModel entity', () {
      // assert
      expect(TestConstants.tGeoCodingModel, isA<GeoCodingModel>());
    });

    group('toJson', () {
      test('Should return a JSON map containing the proper data', () {
        // arrange
        final result = TestConstants.tGeoCodingModel.toJson();
        final expectedMap = jsonDecode(fixture('campsites/models/geocoding_model_response.json'));

        // assert
        expect(result, equals(expectedMap));
      });
    });

    group('fromJson', () {
      test('Should return a GeoCodingModel from entity', () {
        // act
        final result = GeoCodingModel.fromJson(
          jsonDecode(fixture('campsites/models/geocoding_model_response.json')),
        );

        // assert
        expect(result, isA<GeoCodingModel>());
      });
    });
  });
}
