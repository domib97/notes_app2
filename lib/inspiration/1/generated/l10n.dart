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

  /// `Dark Mode`
  String get dark_Mode {
    return Intl.message(
      'Dark Mode',
      name: 'dark_Mode',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get Language {
    return Intl.message(
      'Language',
      name: 'Language',
      desc: '',
      args: [],
    );
  }

  /// `My X`
  String get My_X {
    return Intl.message(
      'My X',
      name: 'My_X',
      desc: '',
      args: [],
    );
  }

  /// `My X`
  String get My_X_title {
    return Intl.message(
      'My X',
      name: 'My_X_title',
      desc: '',
      args: [],
    );
  }

  /// `Boosts`
  String get Boosts {
    return Intl.message(
      'Boosts',
      name: 'Boosts',
      desc: '',
      args: [],
    );
  }

  /// `Power`
  String get power {
    return Intl.message(
      'Power',
      name: 'power',
      desc: '',
      args: [],
    );
  }

  /// `Me`
  String get me {
    return Intl.message(
      'Me',
      name: 'me',
      desc: '',
      args: [],
    );
  }

  /// `Inbox`
  String get inbox {
    return Intl.message(
      'Inbox',
      name: 'inbox',
      desc: '',
      args: [],
    );
  }

  /// `Channels`
  String get channels {
    return Intl.message(
      'Channels',
      name: 'channels',
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

  /// `Boosts`
  String get Boosts_X {
    return Intl.message(
      'Boosts',
      name: 'Boosts_X',
      desc: '',
      args: [],
    );
  }

  /// `Buy more Boost credits to boost posts to \n the top of everyones feed for for 10 \n additonal minutes `
  String get boost_sub_title {
    return Intl.message(
      'Buy more Boost credits to boost posts to \n the top of everyones feed for for 10 \n additonal minutes ',
      name: 'boost_sub_title',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Boost`
  String get boost {
    return Intl.message(
      'Boost',
      name: 'boost',
      desc: '',
      args: [],
    );
  }

  /// `EGP`
  String get egp {
    return Intl.message(
      'EGP',
      name: 'egp',
      desc: '',
      args: [],
    );
  }

  /// `each`
  String get each {
    return Intl.message(
      'each',
      name: 'each',
      desc: '',
      args: [],
    );
  }

  /// `most Popular`
  String get most_popular {
    return Intl.message(
      'most Popular',
      name: 'most_popular',
      desc: '',
      args: [],
    );
  }

  /// `Boost now`
  String get boost_now {
    return Intl.message(
      'Boost now',
      name: 'boost_now',
      desc: '',
      args: [],
    );
  }

  /// `My Karma`
  String get my_karma {
    return Intl.message(
      'My Karma',
      name: 'my_karma',
      desc: '',
      args: [],
    );
  }

  /// `CHAT`
  String get chat {
    return Intl.message(
      'CHAT',
      name: 'chat',
      desc: '',
      args: [],
    );
  }

  /// `NOTIFICATIONS`
  String get notifications {
    return Intl.message(
      'NOTIFICATIONS',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `You have no X notifications right now. Get active to recieve notifications`
  String get notifications_sub_title {
    return Intl.message(
      'You have no X notifications right now. Get active to recieve notifications',
      name: 'notifications_sub_title',
      desc: '',
      args: [],
    );
  }

  /// `Your Chat center is empty Now!`
  String get chat_sub_title {
    return Intl.message(
      'Your Chat center is empty Now!',
      name: 'chat_sub_title',
      desc: '',
      args: [],
    );
  }

  /// `Start Now`
  String get start_now {
    return Intl.message(
      'Start Now',
      name: 'start_now',
      desc: '',
      args: [],
    );
  }

  /// `By clicking the bottom ,you agree to ourTerms of Use and Privacy Policy`
  String get privacy_Policy {
    return Intl.message(
      'By clicking the bottom ,you agree to ourTerms of Use and Privacy Policy',
      name: 'privacy_Policy',
      desc: '',
      args: [],
    );
  }

  /// `local`
  String get local_title {
    return Intl.message(
      'local',
      name: 'local_title',
      desc: '',
      args: [],
    );
  }

  /// `Instantly Chat with people around you`
  String get local_sub_title {
    return Intl.message(
      'Instantly Chat with people around you',
      name: 'local_sub_title',
      desc: '',
      args: [],
    );
  }

  /// `Relevant`
  String get relevant_title {
    return Intl.message(
      'Relevant',
      name: 'relevant_title',
      desc: '',
      args: [],
    );
  }

  /// `Explore communities that interest you`
  String get relevant_sub_title {
    return Intl.message(
      'Explore communities that interest you',
      name: 'relevant_sub_title',
      desc: '',
      args: [],
    );
  }

  /// `Simple`
  String get simple_title {
    return Intl.message(
      'Simple',
      name: 'simple_title',
      desc: '',
      args: [],
    );
  }

  /// `Chat with other through text and image posts`
  String get simple_sub_title {
    return Intl.message(
      'Chat with other through text and image posts',
      name: 'simple_sub_title',
      desc: '',
      args: [],
    );
  }

  /// `Allow Location`
  String get allow_location {
    return Intl.message(
      'Allow Location',
      name: 'allow_location',
      desc: '',
      args: [],
    );
  }

  /// `X needs your location to connect You with the community around you`
  String get location_sub_title {
    return Intl.message(
      'X needs your location to connect You with the community around you',
      name: 'location_sub_title',
      desc: '',
      args: [],
    );
  }

  /// `To which gender do you most indentify?`
  String get gender_sub_title {
    return Intl.message(
      'To which gender do you most indentify?',
      name: 'gender_sub_title',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `No one will see your gender`
  String get gender_Privacy {
    return Intl.message(
      'No one will see your gender',
      name: 'gender_Privacy',
      desc: '',
      args: [],
    );
  }

  /// `What is your Age?`
  String get age_sub_title {
    return Intl.message(
      'What is your Age?',
      name: 'age_sub_title',
      desc: '',
      args: [],
    );
  }

  /// `No one will see your age?`
  String get age_Privacy {
    return Intl.message(
      'No one will see your age?',
      name: 'age_Privacy',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `I confirm that my age is correct`
  String get age_confirm {
    return Intl.message(
      'I confirm that my age is correct',
      name: 'age_confirm',
      desc: '',
      args: [],
    );
  }

  /// `Which user group best descripes you?`
  String get group_sub_title {
    return Intl.message(
      'Which user group best descripes you?',
      name: 'group_sub_title',
      desc: '',
      args: [],
    );
  }

  /// `University Student`
  String get university_student {
    return Intl.message(
      'University Student',
      name: 'university_student',
      desc: '',
      args: [],
    );
  }

  /// `Emplyee`
  String get emplyee {
    return Intl.message(
      'Emplyee',
      name: 'emplyee',
      desc: '',
      args: [],
    );
  }

  /// `Apprentice`
  String get apprentice {
    return Intl.message(
      'Apprentice',
      name: 'apprentice',
      desc: '',
      args: [],
    );
  }

  /// `High School Graduate`
  String get high_school_graduate {
    return Intl.message(
      'High School Graduate',
      name: 'high_school_graduate',
      desc: '',
      args: [],
    );
  }

  /// `High School Student`
  String get high_school_student {
    return Intl.message(
      'High School Student',
      name: 'high_school_student',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get other {
    return Intl.message(
      'Other',
      name: 'other',
      desc: '',
      args: [],
    );
  }

  /// `No one will see your user group`
  String get group_Privacy {
    return Intl.message(
      'No one will see your user group',
      name: 'group_Privacy',
      desc: '',
      args: [],
    );
  }

  /// `Send a new Massage`
  String get send_message_button {
    return Intl.message(
      'Send a new Massage',
      name: 'send_message_button',
      desc: '',
      args: [],
    );
  }

  /// `change Language`
  String get change_Language {
    return Intl.message(
      'change Language',
      name: 'change_Language',
      desc: '',
      args: [],
    );
  }

  /// `SOON!`
  String get soon {
    return Intl.message(
      'SOON!',
      name: 'soon',
      desc: '',
      args: [],
    );
  }

  /// `X back here...`
  String get comment_text_form_hint {
    return Intl.message(
      'X back here...',
      name: 'comment_text_form_hint',
      desc: '',
      args: [],
    );
  }

  /// `User wants to chat with you`
  String get chat_request {
    return Intl.message(
      'User wants to chat with you',
      name: 'chat_request',
      desc: '',
      args: [],
    );
  }

  /// `Accept`
  String get accept {
    return Intl.message(
      'Accept',
      name: 'accept',
      desc: '',
      args: [],
    );
  }

  /// `Deny`
  String get deny {
    return Intl.message(
      'Deny',
      name: 'deny',
      desc: '',
      args: [],
    );
  }

  /// `ago`
  String get ago {
    return Intl.message(
      'ago',
      name: 'ago',
      desc: '',
      args: [],
    );
  }

  /// `Reply to your X`
  String get notification_receive {
    return Intl.message(
      'Reply to your X',
      name: 'notification_receive',
      desc: '',
      args: [],
    );
  }

  /// `Private chat with `
  String get chat_receive {
    return Intl.message(
      'Private chat with ',
      name: 'chat_receive',
      desc: '',
      args: [],
    );
  }

  /// `Share Your thoughts with the whole world`
  String get create_tweet_hint {
    return Intl.message(
      'Share Your thoughts with the whole world',
      name: 'create_tweet_hint',
      desc: '',
      args: [],
    );
  }

  /// `CLOSE`
  String get close {
    return Intl.message(
      'CLOSE',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Would you like to send a private chat request to `
  String get Confirm_chat_request {
    return Intl.message(
      'Would you like to send a private chat request to ',
      name: 'Confirm_chat_request',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Send request`
  String get send_chat_request_button {
    return Intl.message(
      'Send request',
      name: 'send_chat_request_button',
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
