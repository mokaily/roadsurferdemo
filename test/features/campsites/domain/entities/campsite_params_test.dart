import 'package:flutter_test/flutter_test.dart';
import '../../../../test_constants.dart';

void main() {
  group('CampsiteParams', () {
    test('should be equal when all props are equal', () {
      expect(TestConstants.tCampsiteParams1, equals(TestConstants.tCampsiteParams1));
    });

    test('should not be equal if one field is different', () {
      expect(TestConstants.tCampsiteParams1 == TestConstants.tCampsiteParams2, false);
    });
  });
}
