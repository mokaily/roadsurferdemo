import 'package:flutter_test/flutter_test.dart';
import 'package:roadsurferdemo/core/utils/helpers.dart';

void main() {
  group('Helpers.normalizeLatLong', () {
    test('should normalize a double to lat/long format', () {
      final result = Helpers.normalizeLatLong(123.456789);
      expect(result, 12.3456789);
    });
  });

  group('Helpers.validateLatLong', () {
    test('should return true for valid coordinates', () {
      final isValid = Helpers.validateLatLong(lat: 45.0, long: 90.0);
      expect(isValid, true);
    });

    test('should return false for invalid coordinates', () {
      final isValid = Helpers.validateLatLong(lat: -91.0, long: 181.0);
      expect(isValid, false);
    });
  });

  group('Helpers.normalizePrice', () {
    test('should convert integer price to decimal', () {
      final normalized = Helpers.normalizePrice(12345);
      expect(normalized, 123.45);
    });
  });

  group('Helpers.formatURL', () {
    test('should replace http with https', () {
      final url = Helpers.formatURL("http://example.com");
      expect(url, "https://example.com");
    });
  });

  group('Helpers.formattingDate', () {
    test('should format and parse back to DateTime without time', () {
      final date = Helpers.formattingDate("2024-01-01T13:45:00.000Z");
      expect(date.year, 2024);
      expect(date.month, 1);
      expect(date.day, 1);
    });
  });
}
