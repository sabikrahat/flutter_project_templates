import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../../core/config/constants.dart';
import '../../../../localization/loalization.dart';
import '../../../../core/shared/animations_widget/animated_widget_shower.dart';
import '../../../../core/shared/list_tile/k_list_tile.dart';
import '../../../../core/utils/extensions/extensions.dart';

final infoProvider = FutureProvider((_) async => await PackageInfo.fromPlatform());

class AboutTile extends ConsumerWidget {
  const AboutTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final info = ref.watch(infoProvider).value;
    final bn = info?.buildNumber == '0' ? '' : '(${info?.buildNumber})';
    return KListTile(
      leading: AnimatedWidgetShower(
        size: 30.0,
        child: SvgPicture.asset(
          'assets/svgs/about.svg',
          colorFilter: context.theme.primaryColor.toColorFilter,
          semanticsLabel: 'About',
        ),
      ),
      title: Text(t.about, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: info == null ? null : Text('${t.appTitle} ${info.version}$bn'),
      onTap: () => showInfoDialog(context, '${info?.version}$bn'),
    );
  }
}

void showInfoDialog(BuildContext context, String version) => showAboutDialog(
  context: context,
  applicationName: appName,
  applicationVersion: version,
  applicationLegalese: '© 2025 $appName. All rights reserved.',
  applicationIcon: Image.asset('assets/icons/app-icon-1024x1024.png', height: 48, width: 48),
  children: const [
    Text('\nA simple app to manage your restaurant business developed by The Flutter Way.'),
  ],
);
