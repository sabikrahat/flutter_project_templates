import 'package:flutter/material.dart';

import '../../../constants/custom.routes.dart';
import '../../../localization/loalization.dart';
import '../../../theme/themes/themes.dart';
import '../../setting/view/setting.view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          style: roundedButtonStyle,
          onPressed: () async => await fadePush(context, const SettingView()),
          child: Text(t!.setting),
        ),
      ),
    );
  }
}