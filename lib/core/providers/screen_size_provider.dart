import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../notifiers/screen_size_notifier.dart';

final screenSizeProvider = ChangeNotifierProvider((ref) => ScreenSizeNotifier());
