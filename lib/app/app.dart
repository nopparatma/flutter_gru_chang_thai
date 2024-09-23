import 'dart:io';
import 'package:catcher/core/catcher.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gru_chang_thai/app/app_middleware.dart';
import 'package:flutter_gru_chang_thai/core/bloc/application/application_bloc.dart';
import 'package:flutter_gru_chang_thai/core/bloc/splash/splash_bloc.dart';
import 'package:flutter_gru_chang_thai/core/service/translation_service.dart';
import 'package:flutter_gru_chang_thai/ui/router.dart';
import 'package:flutter_gru_chang_thai/shared/colors.dart';
import 'package:flutter_gru_chang_thai/shared/ui_config.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:logger/logger.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'app_config.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart' as transitions_type;

class MainAppLocalization extends StatelessWidget {
  const MainAppLocalization({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ApplicationBloc>(
          create: (context) => ApplicationBloc(),
        ),
        BlocProvider<SplashBloc>(
          create: (context) => SplashBloc(BlocProvider.of<ApplicationBloc>(context)),
        ),
      ],
      child: GlobalLoaderOverlay(
        useDefaultLoading: false,
        overlayColor: Colors.black.withOpacity(0.5),
        overlayWidgetBuilder: (progress) => buildOverlayLoader(),
        child: buildChild(),
      ),
    );
  }

  Widget buildOverlayLoader() {
    return Center(
      child: LoadingAnimationWidget.staggeredDotsWave(
        color: Colors.red.shade900,
        size: 100,
      ),
    );
  }

  buildChild() {
    if (kIsWeb) {
      return const MainWeb();
    } else if (Platform.isAndroid || Platform.isIOS) {
      return Container();
    }
  }
}

class MainWeb extends StatefulWidget {
  const MainWeb({super.key});

  @override
  MainWebState createState() => MainWebState();
}

class MainWebState extends State<MainWeb> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: TranslationService(),
      locale: const Locale('th', 'TH'),
      fallbackLocale: const Locale('th', 'TH'),
      scrollBehavior: CustomScrollBehavior(),
      title: AppConfig.instance.applicationName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: appFontFamily,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
              displayColor: Colors.white,
              fontFamily: appFontFamily,
            ),
        iconTheme: const IconThemeData(color: Colors.white),
        primaryColor: colorBackground,
      ),
      builder: (context, widget) => ResponsiveBreakpoints.builder(
        child: widget!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 820, name: TABLET),
          const Breakpoint(start: 821, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      navigatorObservers: [AppMiddleware()],
      defaultTransition: transitions_type.Transition.noTransition,
      unknownRoute: WebGetXRouter.routes.first,
      getPages: WebGetXRouter.routes,
      navigatorKey: Catcher.navigatorKey,
      initialRoute: RoutePath.index,
    );
  }
}

class AppLogger extends Logger {
  static final AppLogger _instance = AppLogger._internal();

  factory AppLogger() {
    _instance;
    return _instance;
  }

  AppLogger._internal()
      : super(
          printer: PrettyPrinter(
            printEmojis: false,
            methodCount: 0,
          ),
        );

  static AppLogger get instance {
    return _instance;
  }
}

class CustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}
