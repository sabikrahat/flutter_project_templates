import 'dart:convert' show json;

import 'package:flutter/foundation.dart';
import 'package:hive_ce/hive.dart';
import 'package:intl/intl.dart';

import '../../../core/config/constants.dart';
import '../../../core/db/hive.dart';
import '../../../core/utils/extensions/extensions.dart';
import '../provider/date_format_provider.dart';
import '../provider/time_format_provider.dart';
import 'locale/locale_model.dart';
import 'theme/theme_model.dart';

part 'settings_model.g.dart';
part 'settings_model_crud_ext.dart';
part 'settings_model_ext.dart';

@HiveType(typeId: HiveTypes.appSettings)
class AppSettings extends HiveObject {
  AppSettings();

  @HiveField(0)
  bool firstRun = true;
  @HiveField(1)
  bool performanceOverlayEnable = false;
  @HiveField(2)
  String dateFormat = dateFormates.first;
  @HiveField(3)
  String timeFormat = timeFormates.first;
  @HiveField(4)
  DateTime firstRunDateTime = DateTime.now().toUtc();
  @HiveField(5)
  String fontFamily = 'Urbanist';
  @HiveField(6)
  ThemeProfile theme = ThemeProfile.system;
  @HiveField(7)
  LocaleProfile locale = LocaleProfile.spanish;
  @HiveField(8)
  bool isProduction = kReleaseMode;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        'firstRunDateTime': firstRunDateTime.toIso8601String(),
        'performanceOverlayEnable': performanceOverlayEnable,
        'isProduction': isProduction,
        'dateFormat': dateFormat,
        'timeFormat': timeFormat,
        'fontFamily': fontFamily,
        'locale': locale.name,
        'firstRun': firstRun,
        'theme': theme.label,
      };

  factory AppSettings.fromJson(String source) =>
      AppSettings.fromRawJson(json.decode(source));

  factory AppSettings.fromRawJson(Map<String, dynamic> json) => AppSettings()
    ..firstRunDateTime = DateTime.parse(json['firstRunDateTime'] as String)
    ..performanceOverlayEnable = json['performanceOverlayEnable'] as bool
    ..isProduction = json['isProduction'] as bool
    ..locale = LocaleProfile.values.firstWhere(
        (e) => e.name == json['locale'] as String,
        orElse: () => LocaleProfile.english)
    ..theme = ThemeProfile.values.firstWhere(
        (e) => e.name == json['theme'] as String,
        orElse: () => ThemeProfile.light)
    ..dateFormat = json['dateFormat'] as String
    ..timeFormat = json['timeFormat'] as String
    ..fontFamily = json['fontFamily'] as String
    ..firstRun = json['firstRun'] as bool;

  @override
  String toString() => toRawJson();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppSettings &&
        other.firstRunDateTime.microsecondsSinceEpoch ==
            firstRunDateTime.microsecondsSinceEpoch;
  }

  @override
  int get hashCode => firstRunDateTime.microsecondsSinceEpoch;
}
