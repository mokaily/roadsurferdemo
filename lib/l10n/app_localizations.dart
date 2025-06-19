import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Roadsurfer Demo'**
  String get appTitle;

  /// No description provided for @f_filters.
  ///
  /// In en, this message translates to:
  /// **'Filters'**
  String get f_filters;

  /// No description provided for @f_price_range.
  ///
  /// In en, this message translates to:
  /// **'Price Range'**
  String get f_price_range;

  /// No description provided for @f_sort_by.
  ///
  /// In en, this message translates to:
  /// **'Sort By'**
  String get f_sort_by;

  /// No description provided for @f_lowest_price.
  ///
  /// In en, this message translates to:
  /// **'Lowest Price'**
  String get f_lowest_price;

  /// No description provided for @f_highest_price.
  ///
  /// In en, this message translates to:
  /// **'Highest Price'**
  String get f_highest_price;

  /// No description provided for @f_older.
  ///
  /// In en, this message translates to:
  /// **'Older'**
  String get f_older;

  /// No description provided for @f_newer.
  ///
  /// In en, this message translates to:
  /// **'Newer'**
  String get f_newer;

  /// No description provided for @f_features.
  ///
  /// In en, this message translates to:
  /// **'Features'**
  String get f_features;

  /// No description provided for @f_close_to_water.
  ///
  /// In en, this message translates to:
  /// **'Close To Water'**
  String get f_close_to_water;

  /// No description provided for @f_camp_fires_allowed.
  ///
  /// In en, this message translates to:
  /// **'Campfires Allowed'**
  String get f_camp_fires_allowed;

  /// No description provided for @f_languages.
  ///
  /// In en, this message translates to:
  /// **'Languages'**
  String get f_languages;

  /// No description provided for @f_english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get f_english;

  /// No description provided for @f_german.
  ///
  /// In en, this message translates to:
  /// **'German'**
  String get f_german;

  /// No description provided for @f_reset_filters.
  ///
  /// In en, this message translates to:
  /// **'Reset Filters'**
  String get f_reset_filters;

  /// No description provided for @g_header_title.
  ///
  /// In en, this message translates to:
  /// **'Find Your Perfect Campsite'**
  String get g_header_title;

  /// No description provided for @g_header_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Thousands of campsites. One unforgettable adventure.'**
  String get g_header_subtitle;

  /// No description provided for @g_sub_header_title.
  ///
  /// In en, this message translates to:
  /// **'Explore Nature Like Never Before'**
  String get g_sub_header_title;

  /// No description provided for @g_sub_header_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose what matters to you — and we’ll show you where to go.'**
  String get g_sub_header_subtitle;

  /// No description provided for @g_search_campsites.
  ///
  /// In en, this message translates to:
  /// **'Search Campsites'**
  String get g_search_campsites;

  /// No description provided for @g_no_data.
  ///
  /// In en, this message translates to:
  /// **'No campsites found — let’s try something else!'**
  String get g_no_data;

  /// No description provided for @g_campsite_found.
  ///
  /// In en, this message translates to:
  /// **'Campsites found'**
  String get g_campsite_found;

  /// No description provided for @g_night.
  ///
  /// In en, this message translates to:
  /// **' / Night'**
  String get g_night;

  /// No description provided for @m_view_larger_map.
  ///
  /// In en, this message translates to:
  /// **'View larger map'**
  String get m_view_larger_map;

  /// No description provided for @m_get_directions.
  ///
  /// In en, this message translates to:
  /// **'Get directions on this location on\nGoogle Maps.'**
  String get m_get_directions;

  /// No description provided for @m_directions.
  ///
  /// In en, this message translates to:
  /// **'Directions'**
  String get m_directions;

  /// No description provided for @d_per_night.
  ///
  /// In en, this message translates to:
  /// **'per night'**
  String get d_per_night;

  /// No description provided for @d_supported.
  ///
  /// In en, this message translates to:
  /// **'Supported'**
  String get d_supported;

  /// No description provided for @d_highly_rated.
  ///
  /// In en, this message translates to:
  /// **'Highly Rated'**
  String get d_highly_rated;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['de', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de': return AppLocalizationsDe();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
