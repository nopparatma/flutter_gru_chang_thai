import 'package:flutter/material.dart';
import 'package:flutter_gru_chang_thai/ui/page/about_us_page.dart';
import 'package:flutter_gru_chang_thai/ui/page/catalog_page.dart';
import 'package:flutter_gru_chang_thai/ui/page/contact_us_page.dart';
import 'package:flutter_gru_chang_thai/ui/page/home_page.dart';
import 'package:flutter_gru_chang_thai/ui/page/splash_page.dart';
import 'package:go_router/go_router.dart';
import 'common_layout.dart';

class RouteGoPaths {
  static const String index = '/';
  static const String homePage = '/home';
  static const String catalogPage = '/catalog';
  static const String aboutUsPage = '/about_us';
  static const String contactUsPage = '/contact_us';
  static const String splashPage = '/splash';
}

class WebGoRouter {
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');
  static final GlobalKey<NavigatorState> _shellNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'shell');

  static GoRouter generateRoute() {
    return GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: RouteGoPaths.splashPage,
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          path: RouteGoPaths.index,
          parentNavigatorKey: _rootNavigatorKey,
          pageBuilder: (context, state) =>
              const MaterialPage(child: SplashPage()),
        ),
        GoRoute(
          path: RouteGoPaths.splashPage,
          parentNavigatorKey: _rootNavigatorKey,
          pageBuilder: (context, state) =>
              const MaterialPage(child: SplashPage()),
        ),
        ShellRoute(
          parentNavigatorKey: _rootNavigatorKey,
          navigatorKey: _shellNavigatorKey,
          routes: [
            GoRoute(
              path: RouteGoPaths.homePage,
              parentNavigatorKey: _shellNavigatorKey,
              pageBuilder: (context, state) =>
                  const MaterialPage(child: HomePage()),
            ),
            GoRoute(
              path: RouteGoPaths.catalogPage,
              parentNavigatorKey: _shellNavigatorKey,
              pageBuilder: (context, state) =>
                  const MaterialPage(child: CatalogPage()),
            ),
            GoRoute(
              path: RouteGoPaths.aboutUsPage,
              parentNavigatorKey: _shellNavigatorKey,
              pageBuilder: (context, state) =>
                  const MaterialPage(child: AboutUsPage()),
            ),
            GoRoute(
              path: RouteGoPaths.contactUsPage,
              parentNavigatorKey: _shellNavigatorKey,
              pageBuilder: (context, state) =>
                  const MaterialPage(child: ContactUsPage()),
            ),
          ],
          pageBuilder: (context, state, child) {
            return MaterialPage(
                child: CommonLayout(goRouterState: state, child: child));
          },
        ),
      ],
    );
  }
}
