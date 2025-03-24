part of 'locale_model.dart';

extension LocaleProfileExtension on LocaleProfile {
  Locale get locale {
    switch (this) {
      case LocaleProfile.english:
        return enLocale;
      case LocaleProfile.spanish:
        return esLocale;
    }
  }

  String get label {
    switch (this) {
      case LocaleProfile.english:
        return t.english;
      case LocaleProfile.spanish:
        return t.spanish;
    }
  }

  String get languageCode {
    switch (this) {
      case LocaleProfile.english:
        return 'en';
      case LocaleProfile.spanish:
        return 'es';
    }
  }

  bool get isEnglish => this == LocaleProfile.english;

  bool get isSpanish => this == LocaleProfile.spanish;
}
