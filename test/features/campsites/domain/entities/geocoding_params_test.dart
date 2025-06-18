import 'package:flutter_test/flutter_test.dart';
import '../../../../test_constants.dart';

void main() {
  group('GeoCodingParams', () {
    test('should be equal when all props are equal', () {
      expect(TestConstants.tGeoCodingParams1, equals(TestConstants.tGeoCodingParams1));
    });

    test('should not be equal if one field is different', () {
      expect(TestConstants.tGeoCodingParams1 == TestConstants.tGeoCodingParams2, false);
    });
  });
}
