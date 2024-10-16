import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gru_chang_thai/core/bloc/application/application_bloc.dart';
import 'package:flutter_gru_chang_thai/core/bloc/splash/splash_bloc.dart';
import 'package:flutter_gru_chang_thai/ui/go_router.dart';
import 'package:flutter_gru_chang_thai/shared/colors.dart';
import 'package:flutter_gru_chang_thai/shared/ui_config.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:logger/logger.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'app_config.dart';

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
      child: EasyLocalization(
        path: 'assets/languages',
        supportedLocales: const [
          Locale('th'),
          Locale('en'),
        ],
        fallbackLocale: const Locale('th'),
        startLocale: const Locale('th'),
        child: GlobalLoaderOverlay(
          useDefaultLoading: false,
          overlayColor: Colors.black.withOpacity(0.5),
          overlayWidgetBuilder: (progress) => buildOverlayLoader(),
          child: buildChild(),
        ),
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

  Widget buildOverlayLoader() {
    return Center(
      child: LoadingAnimationWidget.staggeredDotsWave(
        color: Colors.red.shade900,
        size: 100,
      ),
    );
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
    return GestureDetector(
      onTapUp: (detail) => FocusScope.of(context).requestFocus(FocusNode()),
      child: MaterialApp.router(
        title: AppConfig.instance.applicationName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: appFontFamily,
          colorScheme: const ColorScheme.dark(
            background: colorBackground,
          ),
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.white,
                displayColor: Colors.white,
                fontFamily: appFontFamily,
              ),
        ),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        builder: (context, widget) => ResponsiveBreakpoints.builder(
          child: widget!,
          breakpoints: [
            const Breakpoint(start: 0, end: 450, name: MOBILE),
            const Breakpoint(start: 451, end: 820, name: TABLET),
            const Breakpoint(start: 821, end: 1920, name: DESKTOP),
            const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
        ),
        routerConfig: WebGoRouter.generateRoute(),
      ),
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
