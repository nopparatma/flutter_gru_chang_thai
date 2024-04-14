import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gru_chang_thai/core/bloc/splash/splash_bloc.dart';
import 'package:flutter_gru_chang_thai/shared/theme.dart';
import 'package:flutter_gru_chang_thai/ui/go_router.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );

  @override
  void initState() {
    super.initState();

    _initPackageInfo();

    BlocProvider.of<SplashBloc>(context).add(SplashLoadInitEvent());
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SuccessSplashLoadInitState) {
          context.go(RouteGoPaths.homePage);
        }
      },
      child: Scaffold(
        body: InkWell(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 8,
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: ResponsiveBreakpoints.of(context).isDesktop ? 300 : 150,
                      child: Hero(
                        tag: 'splashscreenImage',
                        child: Image.asset('assets/images/logo_gru_chang_no_bg.png'),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BlocBuilder<SplashBloc, SplashState>(
                          builder: (context, state) {
                            if (state is LoadingSplashLoadInitState) {
                              return LoadingAnimationWidget.threeArchedCircle(
                                color: Colors.yellow,
                                size: 50,
                              );
                            }

                            return const Offstage();
                          },
                        ),
                        const SizedBox(height: 40.0),
                        _buildMode(),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Version: ${_packageInfo.version} build ${_packageInfo.buildNumber}',
                      style: Theme.of(context).textTheme.normal.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMode() {
    return BlocBuilder<SplashBloc, SplashState>(
      builder: (context, state) {
        if (state is LoadingSplashLoadInitState) {
          return Text.rich(
            TextSpan(
              text: 'Loading... ',
              style: Theme.of(context).textTheme.normal.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              children: [
                TextSpan(
                  text: state.mode,
                  style: Theme.of(context).textTheme.normal.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.amberAccent,
                      ),
                )
              ],
            ),
            textAlign: TextAlign.end,
          );
        }

        if (state is ErrorSplashLoadInitState) {
          return Text(
            'Uh oh!\nLooks like something broke.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.normal.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.amberAccent,
            ),
          );
        }

        return const Offstage();
      },
    );
  }
}
