import '../config/get_platform.dart';
import '../../features/home/view/home.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/view/signin.dart';
import '../../features/auth/view/signup.dart';
import '../../features/settings/view/setting_view.dart';
import '../frogbase/frogbase.dart';
import '../shared/page_not_found/page_not_found.dart';
import '../utils/logger/logger_helper.dart';
import 'app_routes.dart';

final GoRouter goRouter = GoRouter(
  initialLocation: AppRoutes.homeRoute,
  errorBuilder: (_, __) => const KPageNotFound(error: '404 - Page not found!'),
  routes: <RouteBase>[
    GoRoute(path: AppRoutes.homeRoute, name: HomeView.name, builder: (_, __) => const HomeView()),
    GoRoute(
      path: AppRoutes.signinRoute,
      name: SigninView.name,
      builder: (_, __) => const SigninView(),
    ),
    GoRoute(
      path: AppRoutes.signupRoute,
      name: SignupView.name,
      builder: (_, __) => const SignupView(),
    ),
    GoRoute(
      path: AppRoutes.settingsRoute,
      name: SettingsView.name,
      builder: (_, __) => const SettingsView(),
    ),
  ],
  redirect: (context, state) {
    final path = '/${state.fullPath?.split('/').last.toLowerCase()}';
    final loggedIn = apiClient.isLoggedIn;
    log.f('Path: $path');

    /// Auth
    if (!loggedIn && AppRoutes.allAuthRequiredRoutes.contains(path)) {
      log.f('Redirecting to ${AppRoutes.signinRoute} from $path Reason: Authentication.');
      return AppRoutes.signinRoute;
    }
    if (loggedIn && AppRoutes.authRelatedRoutes.contains(path)) {
      log.f('Redirecting to ${AppRoutes.homeRoute} from $path Reason: Already logged in.');
      return AppRoutes.homeRoute;
    }
    return null;
  },
);

extension GoRouteExtension on BuildContext {
  goPush<T>(String route, {Object? extra}) =>
      pt.isWeb
          ? GoRouter.of(this).go(route, extra: extra)
          : GoRouter.of(this).push(route, extra: extra);
}
