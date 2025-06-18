import 'package:flutter_test/flutter_test.dart';
import '../../../../test_constants.dart';

void main() {
  group('FilterParams', () {
    test('should be equal when all props are equal', () {
      expect(TestConstants.tFilterParams1, equals(TestConstants.tFilterParams1));
    });

    test('should not be equal if one field is different', () {
      expect(TestConstants.tFilterParams1 == TestConstants.tFilterParams2, false);
    });
  });
}
