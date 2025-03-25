import 'package:app/src/core/config/get_platform.dart';
import 'package:flutter/material.dart';

import 'components/android_ios_image.dart';
import 'components/linux_windows_macos_image.dart';
import 'components/web_image.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget(this.image, {super.key});

  final dynamic image;

  @override
  Widget build(BuildContext context) {
    return pt.isWeb
        ? WebImage(image.bytes!)
        : pt.isMobile
        ? AndroidIOSImage(image)
        : LinuxWindowsMacOsImage(image);
  }
}
