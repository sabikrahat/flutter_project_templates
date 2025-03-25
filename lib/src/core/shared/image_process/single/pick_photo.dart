import 'package:flutter/material.dart';

import '../../../../injector.dart';
import '../../../config/get_platform.dart';
import 'file_picker.dart';
import 'modal_bottom_sheet_menu.dart';

Future<Object?> pickPhoto(
  BuildContext context, {
  bool isCircle = false,
  int imageQuality = 60,
  List<String>? allowedExtensions,
}) async {
  if (sl<PT>().isMobile) return await modalBottomSheetMenu(context, isCircle: isCircle);
  return await filePickFromDevice();
}
