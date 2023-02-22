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

  /// `Client card`
  String get homeTitleClientAppBar {
    return Intl.message(
      'Client card',
      name: 'homeTitleClientAppBar',
      desc: '',
      args: [],
    );
  }

  /// `Seller`
  String get homeTitleSellerAppBar {
    return Intl.message(
      'Seller',
      name: 'homeTitleSellerAppBar',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get homeDisplayName {
    return Intl.message(
      'Name',
      name: 'homeDisplayName',
      desc: '',
      args: [],
    );
  }

  /// `eMail`
  String get homeDisplayEMail {
    return Intl.message(
      'eMail',
      name: 'homeDisplayEMail',
      desc: '',
      args: [],
    );
  }

  /// `Number`
  String get homeDisplayCount {
    return Intl.message(
      'Number',
      name: 'homeDisplayCount',
      desc: '',
      args: [],
    );
  }

  /// `+1 sales`
  String get homeButtonAddSales {
    return Intl.message(
      '+1 sales',
      name: 'homeButtonAddSales',
      desc: '',
      args: [],
    );
  }

  /// `Go settings screen`
  String get homeButtonSettings {
    return Intl.message(
      'Go settings screen',
      name: 'homeButtonSettings',
      desc: '',
      args: [],
    );
  }

  /// `Load app screen`
  String get homeSemanticLabelLoad {
    return Intl.message(
      'Load app screen',
      name: 'homeSemanticLabelLoad',
      desc: '',
      args: [],
    );
  }

  /// `QR code client data`
  String get homeSemanticLabelQRCode {
    return Intl.message(
      'QR code client data',
      name: 'homeSemanticLabelQRCode',
      desc: '',
      args: [],
    );
  }

  /// `Go client card screen`
  String get homeSemanticLabelButtonClientCard {
    return Intl.message(
      'Go client card screen',
      name: 'homeSemanticLabelButtonClientCard',
      desc: '',
      args: [],
    );
  }

  /// `Go sales screen`
  String get homeSemanticLabelButtonSales {
    return Intl.message(
      'Go sales screen',
      name: 'homeSemanticLabelButtonSales',
      desc: '',
      args: [],
    );
  }

  /// `Scan client card`
  String get homeSemanticLabelButtonScan {
    return Intl.message(
      'Scan client card',
      name: 'homeSemanticLabelButtonScan',
      desc: '',
      args: [],
    );
  }

  /// `Client card screen`
  String get homeSemanticLabelScreenClientCard {
    return Intl.message(
      'Client card screen',
      name: 'homeSemanticLabelScreenClientCard',
      desc: '',
      args: [],
    );
  }

  /// `Sales screen`
  String get homeSemanticLabelScreenSales {
    return Intl.message(
      'Sales screen',
      name: 'homeSemanticLabelScreenSales',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settingsTitleAppBar {
    return Intl.message(
      'Settings',
      name: 'settingsTitleAppBar',
      desc: '',
      args: [],
    );
  }

  /// `User ID`
  String get settingsFieldUserID {
    return Intl.message(
      'User ID',
      name: 'settingsFieldUserID',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get settingsFieldName {
    return Intl.message(
      'Name',
      name: 'settingsFieldName',
      desc: '',
      args: [],
    );
  }

  /// `eMail`
  String get settingsFieldEMail {
    return Intl.message(
      'eMail',
      name: 'settingsFieldEMail',
      desc: '',
      args: [],
    );
  }

  /// `Seller`
  String get settingsFieldSeller {
    return Intl.message(
      'Seller',
      name: 'settingsFieldSeller',
      desc: '',
      args: [],
    );
  }

  /// `Allow edit`
  String get allowEdit {
    return Intl.message(
      'Allow edit',
      name: 'allowEdit',
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
      Locale.fromSubtags(languageCode: 'uk'),
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
