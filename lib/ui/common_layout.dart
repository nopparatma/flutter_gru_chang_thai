import 'package:flutter/material.dart';
import 'package:flutter_gru_chang_thai/shared/theme.dart';
import 'package:flutter_gru_chang_thai/ui/widget/background_image_widget.dart';
import 'package:flutter_gru_chang_thai/ui/widget/menu_top_bar_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:responsive_framework/responsive_framework.dart';

class CommonLayout extends StatefulWidget {
  final GoRouterState goRouterState;
  final Widget child;

  const CommonLayout({
    required this.goRouterState,
    required this.child,
    super.key,
  });

  @override
  CommonLayoutState createState() => CommonLayoutState();
}

class CommonLayoutState extends State<CommonLayout> {
  List<Widget> listMenuWidgets = [];

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
    _initPackageInfo();

    super.initState();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: ListView(
                  physics: const ClampingScrollPhysics(),
                  children: [
                    widget.child,
                    _buildFooter(),
                  ],
                ),
              ),
            ],
          ),
          const MenuTopBarWidget(),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    if (ResponsiveBreakpoints.of(context).isDesktop) {
      return _buildFooterDesktop();
    }

    return _buildFooterMobile();
  }

  Widget _buildFooterDesktop() {
    return SizedBox(
      height: 400,
      child: Stack(
        children: [
          const BackgroundImageWidget(isUseGradient: false),
          _buildFooterDesktopContent(),
        ],
      ),
    );
  }

  Widget _buildFooterMobile() {
    return IntrinsicHeight(
      child: Stack(
        children: [
          const BackgroundImageWidget(isUseGradient: false),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: _buildFooterMobileContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterMobileContent() {
    Widget height = const SizedBox(height: 20);

    return Row(
      children: [
        const Expanded(flex: 1, child: Offstage()),
        Expanded(
          flex: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                child: Image.asset(
                  'assets/images/logo_gru_chang_no_bg.png',
                  fit: BoxFit.cover,
                ),
              ),
              height,
              Text(
                'Guru-Chang Antique\nJewelry Gold Pa-Op',
                style: Theme.of(context).textTheme.normal,
                textAlign: TextAlign.center,
              ),
              height,
              _buildIconTextMobile(Icons.home_work,
                  'The Old Siam Plaza,\n2nd Floor, Zone Silk.'),
              height,
              _buildIconTextMobile(Icons.phone, '083-718-8850'),
              height,
              _buildIconTextMobile(Icons.phone, '083-459-7773'),
              height,
              const Divider(thickness: 0.2),
              height,
              Text(
                'Copyright 2023 GruChangThaiGoldSmith.Com',
                style: Theme.of(context)
                    .textTheme
                    .smaller
                    .copyWith(color: Colors.grey),
              ),
              height,
              Text(
                'Version: ${_packageInfo.version} build ${_packageInfo.buildNumber}',
                style: Theme.of(context)
                    .textTheme
                    .smaller
                    .copyWith(color: Colors.grey),
              ),
              height,
              SizedBox(
                height: 26,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/icon_facebook.png'),
                    const SizedBox(width: 15),
                    Image.asset('assets/images/icon_line.png'),
                  ],
                ),
              )
            ],
          ),
        ),
        const Expanded(flex: 1, child: Offstage()),
      ],
    );
  }

  Widget _buildFooterDesktopContent() {
    Widget spacing = const Expanded(flex: 1, child: Offstage());

    return Row(
      children: [
        spacing,
        Expanded(
          flex: 10,
          child: Column(
            children: [
              spacing,
              Expanded(
                flex: 10,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Image.asset(
                                  'assets/images/logo_gru_chang_no_bg.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(child: Container()),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text('Guru-Chang Antique',
                              style: Theme.of(context).textTheme.normal),
                          const SizedBox(height: 10),
                          _buildIconTextDesktop(Icons.home_work,
                              'The Old Siam Plaza, 2nd Floor, Zone Silk.'),
                          const SizedBox(height: 10),
                          _buildIconTextDesktop(Icons.phone, '083-718-8850'),
                          const SizedBox(height: 10),
                          _buildIconTextDesktop(Icons.phone, '083-459-7773'),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                    spacing,
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: listMenuWidgets,
                            ),
                          ),
                        ],
                      ),
                    ),
                    spacing,
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: listMenuWidgets,
                            ),
                          ),
                        ],
                      ),
                    ),
                    spacing,
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: listMenuWidgets,
                            ),
                          ),
                        ],
                      ),
                    ),
                    spacing,
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: listMenuWidgets,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    const Divider(thickness: 0.2),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Copyright 2023 GruChangThaiGoldSmith.Com',
                            style: Theme.of(context)
                                .textTheme
                                .smaller
                                .copyWith(color: Colors.grey),
                          ),
                          Text(
                            'Version: ${_packageInfo.version} build ${_packageInfo.buildNumber}',
                            style: Theme.of(context)
                                .textTheme
                                .smaller
                                .copyWith(color: Colors.grey),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                Image.asset('assets/images/icon_facebook.png'),
                                const SizedBox(width: 15),
                                Image.asset('assets/images/icon_line.png'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        spacing,
      ],
    );
  }

  Widget _buildIconTextDesktop(IconData icon, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 18,
          color: Colors.yellow,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildIconTextMobile(IconData icon, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 18,
          color: Colors.yellow,
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: Theme.of(context).textTheme.normal,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
