import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Constants {
  static const String kName = 'Roadsurfer Demo';

  static const Map<String, String> kSupportedLanguages = {'en': 'EN', 'de': 'DE'};

  // static const SliverGridDelegate gridDelegate = SliverGridDelegateWithMaxCrossAxisExtent(
  //   maxCrossAxisExtent: 500,
  //   crossAxisSpacing: 8.0,
  //   mainAxisSpacing: 8.0,
  //   mainAxisExtent: 288,
  // );

  static DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
}
