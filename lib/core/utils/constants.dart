import 'package:intl/intl.dart';

class Constants {
  static const String kName = 'Roadsurfer Demo';

  static const String kGeoAPIKey = '3d1b595ebd03421b9dccc61120f4f446';

  static const Map<String, String> kSupportedLanguages = {'en': 'EN', 'de': 'DE'};

  static const Map<String, String> languageLabelsEnglish = {
    'en': 'English',
    'de': 'German',
  };

  static const Map<String, String> languageLabelsGerman = {
    'en': 'Englisch',
    'de': 'Deutsch',
  };

  static DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
}
