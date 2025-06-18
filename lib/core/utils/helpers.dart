import 'package:roadsurferdemo/core/utils/constants.dart';

class Helpers {
  static double normalizeLatLong(double lat) {
    String raw = lat.toString().replaceAll('.', '');

    String beforeDot = raw.substring(0, 2);
    String afterDot = raw.substring(2);

    return double.parse('$beforeDot.$afterDot');
  }

  static bool validateLatLong({required double lat, required double long}) {
    return (lat >= -90 && lat <= 90) && (long >= -180 && long <= 180);
  }

  static double normalizePrice(double price) {
    return double.parse((price / 100).toStringAsFixed(2));
  }

  static String formatURL(String url) {
    return url.replaceFirst("http://", "https://");
  }

  static DateTime formattingDate(String date) {
    final DateTime parsed = DateTime.parse(date).toUtc();
    final String formatted = Constants.dateFormat.format(parsed);
    return Constants.dateFormat.parse(formatted);
  }
}
