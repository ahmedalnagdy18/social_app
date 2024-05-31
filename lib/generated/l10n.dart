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

  /// `Welcome`
  String get title {
    return Intl.message(
      'Welcome',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Posts`
  String get posts {
    return Intl.message(
      'Posts',
      name: 'posts',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `There's no posts`
  String get thereNoPost {
    return Intl.message(
      'There\'s no posts',
      name: 'thereNoPost',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get setting {
    return Intl.message(
      'Setting',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `2 min ago`
  String get time {
    return Intl.message(
      '2 min ago',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `change Language`
  String get changeLang {
    return Intl.message(
      'change Language',
      name: 'changeLang',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `Change Color`
  String get changeColor {
    return Intl.message(
      'Change Color',
      name: 'changeColor',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Logout from the app`
  String get logoutFromApp {
    return Intl.message(
      'Logout from the app',
      name: 'logoutFromApp',
      desc: '',
      args: [],
    );
  }

  /// `Create post`
  String get createPost {
    return Intl.message(
      'Create post',
      name: 'createPost',
      desc: '',
      args: [],
    );
  }

  /// `You can created a post click on the create post button to create your post`
  String get createDescribtion {
    return Intl.message(
      'You can created a post click on the create post button to create your post',
      name: 'createDescribtion',
      desc: '',
      args: [],
    );
  }

  /// `Describtion*`
  String get describtion {
    return Intl.message(
      'Describtion*',
      name: 'describtion',
      desc: '',
      args: [],
    );
  }

  /// `Post`
  String get post {
    return Intl.message(
      'Post',
      name: 'post',
      desc: '',
      args: [],
    );
  }

  /// `Please add both an image and description`
  String get snakBar {
    return Intl.message(
      'Please add both an image and description',
      name: 'snakBar',
      desc: '',
      args: [],
    );
  }

  /// `Language changed successfully`
  String get langSnakBar {
    return Intl.message(
      'Language changed successfully',
      name: 'langSnakBar',
      desc: '',
      args: [],
    );
  }

  /// `AR`
  String get dropdown1 {
    return Intl.message(
      'AR',
      name: 'dropdown1',
      desc: '',
      args: [],
    );
  }

  /// `EN`
  String get dropdown2 {
    return Intl.message(
      'EN',
      name: 'dropdown2',
      desc: '',
      args: [],
    );
  }

  /// `User`
  String get user {
    return Intl.message(
      'User',
      name: 'user',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to logout ?`
  String get logoutmssg {
    return Intl.message(
      'Do you want to logout ?',
      name: 'logoutmssg',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
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
      Locale.fromSubtags(languageCode: 'ar'),
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
