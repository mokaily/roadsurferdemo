import 'package:intl/intl.dart';

class Constants {
  static const String kName = 'Roadsurfer Demo';

  static const String kGeoAPIKey = '3d1b595ebd03421b9dccc61120f4f446';

  static const Map<String, String> kSupportedLanguages = {'en': 'EN', 'de': 'DE'};

  static const Map<String, String> languageLabels = {
    'en': 'English',
    'de': 'German',
  };

  static DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
}
