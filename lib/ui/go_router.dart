import 'package:flutter/material.dart';
import 'package:flutter_gru_chang_thai/ui/page/about_us_page.dart';
import 'package:flutter_gru_chang_thai/ui/page/catalog_page.dart';
import 'package:flutter_gru_chang_thai/ui/page/contact_us_page.dart';
import 'package:flutter_gru_chang_thai/ui/page/home_page.dart';
import 'package:flutter_gru_chang_thai/ui/page/splash_page.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:go_router/go_router.dart';
import 'common_layout.dart';

class RoutePath {
  static const String index = '/';
  static const String homePage = '/home';
  static const String catalogPage = '/catalog';
  static const String aboutUsPage = '/about_us';
  static const String contactUsPage = '/contact_us';
  static const String splashPage = '/splash';
}

class WebGetXRouter {
  static final routes = [
    GetPage(name: RoutePath.splashPage, page: () => const SplashPage()),
    GetPage(name: RoutePath.homePage, page: () => const CommonLayout(child: HomePage()), transition: Transition.noTransition),
    GetPage(name: RoutePath.catalogPage, page: () => const CommonLayout(child: CatalogPage()), transition: Transition.noTransition),
    GetPage(name: RoutePath.aboutUsPage, page: () => const CommonLayout(child: AboutUsPage()), transition: Transition.noTransition),
    GetPage(name: RoutePath.contactUsPage, page: () => const CommonLayout(child: ContactUsPage()), transition: Transition.noTransition),
  ];
}
