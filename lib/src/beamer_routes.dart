import 'package:beamer/beamer.dart'
    show BeamGuard, BeamPage, BeamPageType, BeamerDelegate, RoutesLocationBuilder;
import 'package:flutter/widgets.dart' show ValueKey;
import 'package:flutter_project_templates/src/modules/home/view/home.view.dart';
import 'package:flutter_project_templates/src/shared/page_not_found/page_not_found.dart';

import 'app_routes.dart' show AppRoutes;
import 'constants/constants.dart';
import 'modules/maintenance_break/maintenance_break.dart';
import 'modules/setting/view/setting.view.dart';

final routerDelegate = BeamerDelegate(
  initialPath: AppRoutes.homeRoute,
  notFoundPage: const BeamPage(
    title: 'Page not found - $appName',
    child: KPageNotFound(error: '404 - Page not found!'),
  ),
  locationBuilder: RoutesLocationBuilder(
    routes: {
      AppRoutes.homeRoute: (_, __, ___) {
        return const BeamPage(
          key: ValueKey(AppRoutes.homeRoute),
          title: appTitle,
          type: BeamPageType.slideRightTransition,
          child: HomeView(),
        );
      },
      AppRoutes.settingsRoute: (_, __, ___) {
        return const BeamPage(
          key: ValueKey(AppRoutes.settingsRoute),
          title: '$appName - Settings',
          type: BeamPageType.slideRightTransition,
          child: SettingView(),
        );
      },
      
      AppRoutes.maintenanceBreakRoute: (_, __, ___) {
        return const BeamPage(
          key: ValueKey(AppRoutes.settingsRoute),
          title: '$appName - Maintenance break',
          type: BeamPageType.slideRightTransition,
          child: MaintenanceBreak(),
        );
      },
    },
  ),
  guards: [
    BeamGuard(
      pathPatterns: AppRoutes.allRoutes,
      check: (_, __) => !isMaintenanceBreak,
      beamToNamed: (_, __) => AppRoutes.maintenanceBreakRoute,
    ),
  ],
);
