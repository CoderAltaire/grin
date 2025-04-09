// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

// `Confirmation`
  String get strConfirmation {
    return Intl.message(
      'Confirmation',
      name: 'strConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get strProfile {
    return Intl.message(
      'Profile',
      name: 'strProfile',
      desc: '',
      args: [],
    );
  }

  String get strName {
    return Intl.message(
      'Name',
      name: 'strName',
      desc: '',
      args: [],
    );
  }

  String get strGetStarted {
    return Intl.message(
      'Get Started',
      name: 'strGetStarted',
      desc: '',
      args: [],
    );
  }

  String get strBack {
    return Intl.message(
      'Get Started',
      name: 'strBack',
      desc: '',
      args: [],
    );
  }

  String get strMyResults {
    return Intl.message(
      'Get Started',
      name: 'strMyResults',
      desc: '',
      args: [],
    );
  }

  String get strChangePh {
    return Intl.message(
      'Get Started',
      name: 'strChangePh',
      desc: '',
      args: [],
    );
  }

  String get strDelPh {
    return Intl.message(
      'Get Started',
      name: 'strDelPh',
      desc: '',
      args: [],
    );
  }

  String get strLanguage {
    return Intl.message(
      'language',
      name: 'strLanguage',
      desc: '',
      args: [],
    );
  }

  String get strCustomizeLg {
    return Intl.message(
      'language',
      name: 'strCustomizeLg',
      desc: '',
      args: [],
    );
  }

  String get strChoosePreTheme {
    return Intl.message(
      'ChoosePreTheme',
      name: 'strChoosePreTheme',
      desc: '',
      args: [],
    );
  }

  String get strThemeColor {
    return Intl.message(
      'ThemeColor',
      name: 'strThemeColor',
      desc: '',
      args: [],
    );
  }

  String get strUserName {
    return Intl.message(
      'UserName',
      name: 'strUserName',
      desc: '',
      args: [],
    );
  }

  String get strPassword {
    return Intl.message(
      'Password',
      name: 'strPassword',
      desc: '',
      args: [],
    );
  }

  String get strRecCertificate {
    return Intl.message(
      'RecCertificate',
      name: 'strRecCertificate',
      desc: '',
      args: [],
    );
  }

  String get strStartedCourses {
    return Intl.message(
      'StrCourses',
      name: 'strStartedCourses',
      desc: '',
      args: [],
    );
  }

  String get strCourseProgram {
    return Intl.message(
      'Courses and Programmmmmmm',
      name: 'strCourseProgram',
      desc: '',
      args: [],
    );
  }

  String get strCourses {
    return Intl.message(
      'Courses',
      name: 'strCourses',
      desc: '',
      args: [],
    );
  }

  String get strSettinges {
    return Intl.message(
      'Settinges',
      name: 'strSettinges',
      desc: '',
      args: [],
    );
  }

  String get strCertificate {
    return Intl.message(
      'Certificates',
      name: 'strCertificate',
      desc: '',
      args: [],
    );
  }

  /// `Comments`
  String get strFeed {
    return Intl.message(
      'Reyting',
      name: 'strFeed',
      desc: '',
      args: [],
    );
  }

  String get main {
    return Intl.message(
      'Main',
      name: 'main',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get strCategory {
    return Intl.message(
      'Category',
      name: 'strCategory',
      desc: '',
      args: [],
    );
  }

  /// `Orders`
  String get strOrders {
    return Intl.message(
      'Orders',
      name: 'strOrders',
      desc: '',
      args: [],
    );
  }

  /// `Select Language`
  String get strSelectLanguage {
    return Intl.message(
      'Select Language',
      name: 'strSelectLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Uzbek`
  String get strUzbek {
    return Intl.message(
      'Uzbek',
      name: 'strUzbek',
      desc: '',
      args: [],
    );
  }

  /// `Russian`
  String get strRussian {
    return Intl.message(
      'Russian',
      name: 'strRussian',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get strEnglish {
    return Intl.message(
      'English',
      name: 'strEnglish',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get strLogOut {
    return Intl.message(
      'Log Out',
      name: 'strLogOut',
      desc: '',
      args: [],
    );
  }

  /// `Confirmation Code`
  String get strConfirmationCode {
    return Intl.message(
      'Confirmation Code',
      name: 'strConfirmationCode',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Phone Number`
  String get strEnterYourPhone {
    return Intl.message(
      'Enter your Phone Number',
      name: 'strEnterYourPhone',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid phone number.`
  String get strEnterValidPhone {
    return Intl.message(
      'Enter a valid phone number.',
      name: 'strEnterValidPhone',
      desc: '',
      args: [],
    );
  }

  /// `User deactivated. Please contact the administrator.`
  String get strUserDeactived {
    return Intl.message(
      'User deactivated. Please contact the administrator.',
      name: 'strUserDeactived',
      desc: '',
      args: [],
    );
  }

  /// `You have not purchased this product in the last month.`
  String get strHaveNotPurchased {
    return Intl.message(
      'You have not purchased this product in the last month.',
      name: 'strHaveNotPurchased',
      desc: '',
      args: [],
    );
  }

  /// `Your Phone Number`
  String get strYourPhone {
    return Intl.message(
      'Your Phone Number',
      name: 'strYourPhone',
      desc: '',
      args: [],
    );
  }

  /// `This phone number is already in use.`
  String get strAlreadyInUse {
    return Intl.message(
      'This phone number is already in use.',
      name: 'strAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect Code`
  String get strWrongCode {
    return Intl.message(
      'Incorrect Code',
      name: 'strWrongCode',
      desc: '',
      args: [],
    );
  }

  /// `Cache Error`
  String get strCachFailure {
    return Intl.message(
      'Cache Error',
      name: 'strCachFailure',
      desc: '',
      args: [],
    );
  }

  /// `User not found`
  String get strUserNotfound {
    return Intl.message(
      'User not found',
      name: 'strUserNotfound',
      desc: '',
      args: [],
    );
  }

  /// `Unknown Error`
  String get strUnknownFailure {
    return Intl.message(
      'Unknown Error',
      name: 'strUnknownFailure',
      desc: '',
      args: [],
    );
  }

  /// `Authorization Error`
  String get strUnAuthorizationFailure {
    return Intl.message(
      'Authorization Error',
      name: 'strUnAuthorizationFailure',
      desc: '',
      args: [],
    );
  }

  /// `Internet Connection Error`
  String get strCheckInternetConnection {
    return Intl.message(
      'Internet Connection Error',
      name: 'strCheckInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Email or Password is incorrect`
  String get strEmailOrPasswordWrong {
    return Intl.message(
      'Email or Password is incorrect',
      name: 'strEmailOrPasswordWrong',
      desc: '',
      args: [],
    );
  }

  /// `Server Error`
  String get strServerError {
    return Intl.message(
      'Server Error',
      name: 'strServerError',
      desc: '',
      args: [],
    );
  }

  /// `Home and garden`
  String get strHome {
    return Intl.message(
      'Home',
      name: 'strHome',
      desc: '',
      args: [],
    );
  }

  /// `sum`
  String get strSum {
    return Intl.message(
      'sum',
      name: 'strSum',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get strRetry {
    return Intl.message(
      'Retry',
      name: 'strRetry',
      desc: '',
      args: [],
    );
  }

  /// `cannot be empty!`
  String get strCannotBeEmpty {
    return Intl.message(
      'cannot be empty!',
      name: 'strCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `The number was entered incorrectly.`
  String get strTheNumberWasEnteredIncorrectly {
    return Intl.message(
      'The number was entered incorrectly.',
      name: 'strTheNumberWasEnteredIncorrectly',
      desc: '',
      args: [],
    );
  }

  /// `Attention, Error!`
  String get strAttentionError {
    return Intl.message(
      'Attention, Error!',
      name: 'strAttentionError',
      desc: '',
      args: [],
    );
  }

  /// `No Internet Connection!`
  String get strNoConnectionInternet {
    return Intl.message(
      'No Internet Connection!',
      name: 'strNoConnectionInternet',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'uz'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
