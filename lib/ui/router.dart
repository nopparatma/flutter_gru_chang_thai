import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gru_chang_thai/app/app.dart';
import 'package:flutter_gru_chang_thai/app/app_middleware.dart';
import 'package:flutter_gru_chang_thai/ui/page/about_us/about_us_page.dart';
import 'package:flutter_gru_chang_thai/ui/page/catalog/catalog_page.dart';
import 'package:flutter_gru_chang_thai/ui/page/contact_us/contact_us_page.dart';
import 'package:flutter_gru_chang_thai/ui/page/home_page.dart';
import 'package:flutter_gru_chang_thai/ui/page/splash_page.dart';
import 'package:get/get.dart';
import 'common_layout.dart';

class RoutePath {
  static const String index = '/';
  static const String notFound = '/not-found';
  static const String homePage = '/home';
  static const String catalogPage = '/catalog';
  static const String aboutUsPage = '/about-us';
  static const String contactUsPage = '/contact-us';
  static const String splashPage = '/splash';
}

class WebGetXRouter {
  static final routes = [
    GetPage(
      name: RoutePath.index,
      page: () => const SplashPage(),
      middlewares: [AppMiddleware()],
      children: [
        GetPage(name: RoutePath.splashPage, page: () => const SplashPage()),
        GetPage(name: RoutePath.homePage, page: () => const CommonLayout(child: HomePage())),
        GetPage(name: RoutePath.catalogPage, page: () => const CommonLayout(child: CatalogPage())),
        GetPage(name: RoutePath.aboutUsPage, page: () => const CommonLayout(child: AboutUsPage())),
        GetPage(name: RoutePath.contactUsPage, page: () => const CommonLayout(child: ContactUsPage())),
      ],
    ),
  ];
}
