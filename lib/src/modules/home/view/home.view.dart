import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../../../app_routes.dart';
import '../../../constants/constants.dart';
import '../../../constants/custom.routes.dart';
import '../../../localization/loalization.dart';
import '../../../theme/themes/themes.dart';
import '../../setting/view/setting.view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    t = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: mainMin,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Test',
                  hintText: 'For testing purpose...',
                  suffixIcon: Icon(Icons.search),
                ),
              ),
              const SizedBox(height: 10.0),
              Card(
                child: ListTile(
                  title: Text(t!.setting),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () =>
                      Beamer.of(context).beamToNamed(AppRoutes.settingsRoute),
                ),
              ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                style: roundedButtonStyle,
                onPressed: () async =>
                    await fadePush(context, const SettingView()),
                child: Text(t!.setting),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Beamer.of(context).beamToNamed(AppRoutes.settingsRoute),
        child: const Icon(Icons.settings),
      ),
    );
  }
}
