import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:roadsurferdemo/features/campsites/data/models/campsite_model.dart';
import '../../../../fixtures/fixture_reader.dart';
import '../../../../test_constants.dart';

void main() {
  test('Should be a subclass of CampsiteModel entity', () {
    // assert
    expect(TestConstants.tCampsiteModel, isA<CampsiteModel>());
  });

  group('toJson', () {
    test('Should return a JSON map containing the proper data', () {
      // arrange
      final result = TestConstants.tCampsiteModel.toJson();
      final expectedMap = jsonDecode(fixture('campsites/models/campsite_model_response.json'));

      // assert
      expect(result, equals(expectedMap));
    });
  });

  group('fromJson', () {
    test('Should return a CampsiteModel from entity', () {
      // act
      final result = CampsiteModel.fromJson(
        jsonDecode(fixture('campsites/models/campsite_model_response.json')),
      );

      // assert
      expect(result, isA<CampsiteModel>());
    });
  });
}
