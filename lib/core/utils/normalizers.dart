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
    return double.parse((price / 1000).toStringAsFixed(2));
  }
}
