import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'src/app.dart' show App;
import 'src/core/api_client/api_client.dart';
import 'src/core/config/environment.dart';
import 'src/core/config/get_platform.dart';
import 'src/core/db/init.dart';
import 'src/core/db/paths.dart';
import 'src/core/utils/themes/themes.dart';
import 'src/injector.dart';

void main() async {
  await _init();
  runApp(const ProviderScope(child: App()));
}

Future<void> _init() async {
  FlutterNativeSplash.preserve(widgetsBinding: WidgetsFlutterBinding.ensureInitialized());
  await dotenv.load(fileName: Environment.fileName);
  await initializeServiceLocator();
  _configEasyLoading();
  await openDB();
  await _initFastCachedImageConfig();
  await initAppDatum();
  await sl<ApiClient>().init();
  if (sl<PT>().isWeb) setUrlStrategy(PathUrlStrategy());
  FlutterNativeSplash.remove();
}

Future<void> _initFastCachedImageConfig() async {
  await FastCachedImageConfig.init(
    subDir: sl<PT>().isWeb ? '' : sl<AppDir>().files.path,
    clearCacheAfter: const Duration(days: 15),
  );
}

void _configEasyLoading() =>
    EasyLoading.instance
      ..loadingStyle = EasyLoadingStyle.custom
      ..backgroundColor = Colors.transparent
      ..boxShadow = const <BoxShadow>[]
      ..indicatorColor = kPrimaryColor
      ..progressColor = kPrimaryColor
      ..textColor = Colors.white
      ..textStyle = const TextStyle(
        fontSize: 16.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      )
      ..dismissOnTap = false
      ..userInteractions = false
      ..maskType = EasyLoadingMaskType.custom
      ..maskColor = Colors.black.withValues(alpha: 0.8)
      ..indicatorWidget = const SizedBox(
        height: 70.0,
        width: 70.0,
        child: SpinKitThreeBounce(color: kPrimaryColor, size: 30.0),
      )
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle;
