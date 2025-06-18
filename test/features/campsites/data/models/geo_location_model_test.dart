import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:roadsurferdemo/features/campsites/data/models/geo_location_model.dart';

import '../../../../fixtures/fixture_reader.dart';
import '../../../../test_constants.dart';

void main() {
  group('GeoLocationModel', () {
    test('Should be a subclass of GeoLocationModel entity', () {
      // assert
      expect(TestConstants.tGeoLocationModel, isA<GeoLocationModel>());
    });

    group('toJson', () {
      test('Should return a JSON map containing the proper data', () {
        // arrange
        final result = TestConstants.tGeoLocationModel.toJson();
        final expectedMap = jsonDecode(fixture('campsites/models/geo_location_model_response.json'));

        // assert
        expect(result, equals(expectedMap));
      });
    });

    group('fromJson', () {
      test('Should return a GeoLocationModel from entity', () {
        // act
        final result = GeoLocationModel.fromJson(
          jsonDecode(fixture('campsites/models/geo_location_model_response.json')),
        );

        // assert
        expect(result, isA<GeoLocationModel>());
      });
    });
  });
}
