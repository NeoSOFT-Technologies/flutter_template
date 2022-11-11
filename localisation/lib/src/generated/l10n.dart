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

class Strings {
  Strings();

  static Strings? _current;

  static Strings get current {
    assert(_current != null,
        'No instance of Strings was loaded. Try to initialize the Strings delegate before accessing Strings.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Strings> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Strings();
      Strings._current = instance;

      return instance;
    });
  }

  static Strings of(BuildContext context) {
    final instance = Strings.maybeOf(context);
    assert(instance != null,
        'No instance of Strings present in the widget tree. Did you add Strings.delegate in localizationsDelegates?');
    return instance!;
  }

  static Strings? maybeOf(BuildContext context) {
    return Localizations.of<Strings>(context, Strings);
  }

  /// `MyAppName`
  String get appName {
    return Intl.message(
      'MyAppName',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Good \nMorning`
  String get goodMorning {
    return Intl.message(
      'Good \nMorning',
      name: 'goodMorning',
      desc: '',
      args: [],
    );
  }

  /// `Good \nAfternoon`
  String get goodAfternoon {
    return Intl.message(
      'Good \nAfternoon',
      name: 'goodAfternoon',
      desc: '',
      args: [],
    );
  }

  /// `Good \nEvening`
  String get goodEvening {
    return Intl.message(
      'Good \nEvening',
      name: 'goodEvening',
      desc: '',
      args: [],
    );
  }

  /// `Hours`
  String get hours {
    return Intl.message(
      'Hours',
      name: 'hours',
      desc: '',
      args: [],
    );
  }

  /// `Min`
  String get min {
    return Intl.message(
      'Min',
      name: 'min',
      desc: '',
      args: [],
    );
  }

  /// `Sec`
  String get sec {
    return Intl.message(
      'Sec',
      name: 'sec',
      desc: '',
      args: [],
    );
  }

  /// `Your Favourite`
  String get yourFav {
    return Intl.message(
      'Your Favourite',
      name: 'yourFav',
      desc: '',
      args: [],
    );
  }

  /// `My Home`
  String get home {
    return Intl.message(
      'My Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Navigation`
  String get navigation {
    return Intl.message(
      'Navigation',
      name: 'navigation',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Today's Weather`
  String get todayWeather {
    return Intl.message(
      'Today\'s Weather',
      name: 'todayWeather',
      desc: '',
      args: [],
    );
  }

  /// `Wind`
  String get wind {
    return Intl.message(
      'Wind',
      name: 'wind',
      desc: '',
      args: [],
    );
  }

  /// `Humidity`
  String get humidity {
    return Intl.message(
      'Humidity',
      name: 'humidity',
      desc: '',
      args: [],
    );
  }

  /// `Future weather`
  String get futureWeather {
    return Intl.message(
      'Future weather',
      name: 'futureWeather',
      desc: '',
      args: [],
    );
  }

  /// `New York`
  String get newYorkStaticText {
    return Intl.message(
      'New York',
      name: 'newYorkStaticText',
      desc: '',
      args: [],
    );
  }

  /// `23`
  String get degreeStaticText {
    return Intl.message(
      '23',
      name: 'degreeStaticText',
      desc: '',
      args: [],
    );
  }

  /// `12`
  String get favDegreeStaticText {
    return Intl.message(
      '12',
      name: 'favDegreeStaticText',
      desc: '',
      args: [],
    );
  }

  /// `Los Angeles`
  String get losAngelesStaticText {
    return Intl.message(
      'Los Angeles',
      name: 'losAngelesStaticText',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Strings> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Strings> load(Locale locale) => Strings.load(locale);
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
