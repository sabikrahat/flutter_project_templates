import '../../../core/config/constants.dart';
import '../../../core/utils/extensions/extensions.dart';
import '../../settings/view/setting_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String name = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(child: Center(child: Text(appName))),
      floatingActionButton: FloatingActionButton.small(
        onPressed: () async => await context.goPush(SettingsView.name),
        child: Icon(Icons.settings_outlined),
      ),
    );
  }
}
