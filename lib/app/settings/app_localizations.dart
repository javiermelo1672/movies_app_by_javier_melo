import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();
  @override
  bool isSupported(Locale locale) => ['en'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    Intl.defaultLocale = locale.languageCode;
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}

class AppLocalizations {
  Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  set localizedValues(Map<String, dynamic> value) {
    if (value == null) {
      value = {};
    }
    _localizedValues = value;
  }

  String? getLocalizedValue(String? key) {
    if (key != null && _localizedValues.containsKey(key)) {
      return _localizedValues[key];
    }
    return key;
  }

  static Map<String, dynamic> _localizedValues = {
    'messageError':
        'I am sorry your connection is not available, please try again later',
    "welcomeMessage": "Welcome!",
    "signUp": "Sign Up",
    "login": "Log in",
    "forgotPassword": "Forgot Password?",
    "name": "Name",
    "password": "Password",
    "error": "Error",
    "accept": "Accept",
    "cancel": "Cancel",
    "appName": "Leal Test By Javier Melo",
    "retry": "Retry",
    "warning": "Warning",
    "unimplementedFunction": "Unimplemented Function",
    "home": "Home",
    "favorites": "Favorites",
    "recent": "Recent",
    "search": "Search",
  };

  String? get messageError => getLocalizedValue('messageError');
  String? get welcomeMessage => getLocalizedValue('welcomeMessage');
  String? get signUp => getLocalizedValue('signUp');
  String? get login => getLocalizedValue('login');
  String? get forgotPassword => getLocalizedValue('forgotPassword');
  String? get name => getLocalizedValue('name');
  String? get password => getLocalizedValue('password');
  String? get error => getLocalizedValue('error');
  String? get accept => getLocalizedValue('accept');
  String? get cancel => getLocalizedValue('cancel');
  String? get appName => getLocalizedValue('appName');
  String? get retry => getLocalizedValue('retry');
  String? get warning => getLocalizedValue('warning');
  String? get unimplementedFunction =>
      getLocalizedValue('unimplementedFunction');
  String? get home => getLocalizedValue('home');
  String? get favorites => getLocalizedValue('favorites');
  String? get recent => getLocalizedValue('recent');
  String? get search => getLocalizedValue('search');
}
