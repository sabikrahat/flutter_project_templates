import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';

import '../../../../core/db/hive.dart';
import '../../../../core/utils/extensions/extensions.dart';
import '../../../../localization/loalization.dart';

part 'theme_model.g.dart';
part 'theme_model_ext.dart';

@HiveType(typeId: HiveTypes.themeProfile)
enum ThemeProfile {
  @HiveField(0)
  system,
  @HiveField(1)
  light,
  @HiveField(2)
  dark,
}
