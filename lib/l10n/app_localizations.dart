import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

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
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  /// The current Language
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get language;

  /// The EXM mortage
  ///
  /// In en, this message translates to:
  /// **'Existing morgage?'**
  String get exm;

  /// option yes
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// survey text
  ///
  /// In en, this message translates to:
  /// **'Survey'**
  String get survey;

  /// Washer text
  ///
  /// In en, this message translates to:
  /// **'Washer'**
  String get washer;

  /// Range text
  ///
  /// In en, this message translates to:
  /// **'Range'**
  String get range;

  /// Dryer text
  ///
  /// In en, this message translates to:
  /// **'Dryer'**
  String get dryer;

  /// Gas utility available text
  ///
  /// In en, this message translates to:
  /// **'Gas utility available?'**
  String get gua;

  /// wateron text
  ///
  /// In en, this message translates to:
  /// **'Water on?'**
  String get wateron;

  /// Sewer text
  ///
  /// In en, this message translates to:
  /// **'Sewer'**
  String get sewer;

  /// bto text
  ///
  /// In en, this message translates to:
  /// **'Backed tax owed?'**
  String get bto;

  /// Leins on property text
  ///
  /// In en, this message translates to:
  /// **'Leins on property?'**
  String get lop;

  /// es propiedad text
  ///
  /// In en, this message translates to:
  /// **'Is property?'**
  String get isProp;

  /// es propiedad text
  ///
  /// In en, this message translates to:
  /// **'vecant'**
  String get vecant;

  /// es propiedad text
  ///
  /// In en, this message translates to:
  /// **'occupied'**
  String get occupied;

  /// Is there a lock box for inspections
  ///
  /// In en, this message translates to:
  /// **'Is there a lock box for inspections?'**
  String get istherelopinspec;

  /// Is there a lock box for inspections
  ///
  /// In en, this message translates to:
  /// **'Open to owner financed'**
  String get opentoOfinanced;

  /// Are you looking for a new primary home after selling current home?
  ///
  /// In en, this message translates to:
  /// **'Are you looking for a new primary home after selling current home?'**
  String get areyoulooking;

  /// desc here
  ///
  /// In en, this message translates to:
  /// **'Do you need assistance finding a new home?'**
  String get assistancefornewhome;

  /// desc here
  ///
  /// In en, this message translates to:
  /// **'Do you need help finding a morgage lender if your selling?'**
  String get morgagelender;

  /// desc here
  ///
  /// In en, this message translates to:
  /// **'Foundation'**
  String get foundation;

  /// desc here
  ///
  /// In en, this message translates to:
  /// **'pier & beam'**
  String get pierandbeam;

  /// desc here
  ///
  /// In en, this message translates to:
  /// **'slab'**
  String get slab;

  /// desc here
  ///
  /// In en, this message translates to:
  /// **'Have Basement?'**
  String get havebasement;

  /// desc here
  ///
  /// In en, this message translates to:
  /// **'Backed Tax amount owed'**
  String get backedtaxamount;

  /// desc here
  ///
  /// In en, this message translates to:
  /// **'Enter Amount'**
  String get enteramount;

  /// desc here
  ///
  /// In en, this message translates to:
  /// **'Leins on property? Explain'**
  String get lopexplain;

  /// desc here
  ///
  /// In en, this message translates to:
  /// **'Explain Please..'**
  String get explease;

  /// desc here
  ///
  /// In en, this message translates to:
  /// **'Describe best place for Luna Enterprises lockbox to be placed.'**
  String get describeplace;

  /// desc here
  ///
  /// In en, this message translates to:
  /// **'Describe..'**
  String get describe;

  /// desc here
  ///
  /// In en, this message translates to:
  /// **'Time frame of selling property?'**
  String get timeframe;

  /// desc here
  ///
  /// In en, this message translates to:
  /// **'Eg, 14 Days'**
  String get eg;

  /// Are you needing fast cash to help with moving or other expenses?
  ///
  /// In en, this message translates to:
  /// **'Are you needing fast cash to help with moving or other expenses?'**
  String get fastcash;

  /// desc here
  ///
  /// In en, this message translates to:
  /// **'Payment?'**
  String get payment;

  /// desc here
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get cash;

  /// desc here
  ///
  /// In en, this message translates to:
  /// **'Check'**
  String get check;

  /// desc here
  ///
  /// In en, this message translates to:
  /// **'Wire Deposit'**
  String get wiredep;

  /// desc here
  ///
  /// In en, this message translates to:
  /// **'-note exchange happens with escrow company. Beware of wire fraud. Wire transfers are made from only Luna Enterprises LLC / agreed title company.'**
  String get note;

  /// desc here
  ///
  /// In en, this message translates to:
  /// **'Rate Your Home Condition'**
  String get ratecond;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
