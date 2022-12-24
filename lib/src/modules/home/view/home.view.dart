import 'package:flutter/material.dart';
import '../../../constants/constants.dart';

import '../../../constants/custom.routes.dart';
import '../../../localization/loalization.dart';
import '../../../theme/themes/themes.dart';
import '../../setting/view/setting.view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
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
                  onTap: () async =>
                      await fadePush(context, const SettingView()),
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
        onPressed: () async => await fadePush(context, const SettingView()),
        child: const Icon(Icons.settings),
      ),
    );
  }
}
