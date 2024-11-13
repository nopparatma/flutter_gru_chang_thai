import 'package:flutter/material.dart';
import 'package:flutter_gru_chang_thai/shared/theme.dart';
import 'package:flutter_gru_chang_thai/utils/url_utils.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import 'background_image_widget.dart';

class SocialItem {
  final String icon;
  final String url;

  SocialItem({required this.icon, required this.url});
}

class FooterWidget extends StatefulWidget {
  const FooterWidget({super.key});

  @override
  FooterWidgetState createState() => FooterWidgetState();
}

class FooterWidgetState extends State<FooterWidget> {
  List<SocialItem> listSocialItems = [
    SocialItem(icon: 'assets/icons/icon_facebook.png', url: 'https://www.facebook.com/guruchang.gurusiam'),
    SocialItem(icon: 'assets/icons/icon_line.png', url: 'https://lin.ee/mPCxlxG'),
    SocialItem(icon: 'assets/icons/icon_tiktok.png', url: 'https://www.tiktok.com/@guruchang.tong'),
    SocialItem(icon: 'assets/icons/icon_youtube.png', url: 'https://www.youtube.com/@gruchangthong'),
  ];

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
    if (ResponsiveBreakpoints.of(context).isDesktop) {
      return _buildFooterDesktop();
    }

    return _buildFooterMobile();
  }

  Widget _buildFooterDesktop() {
    return IntrinsicHeight(
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
          _buildFooterMobileContent(),
        ],
      ),
    );
  }

  Widget _buildFooterMobileContent() {
    Widget spacing = const Expanded(flex: 1, child: Offstage());
    Widget height = const SizedBox(height: 20);

    return Row(
      children: [
        spacing,
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
              _buildIconText(Icons.home_work, 'The Old Siam Plaza,\n2nd Floor, Zone Silk.'),
              height,
              _buildIconText(Icons.phone, '083-718-8850'),
              height,
              _buildIconText(Icons.phone, '083-459-7773'),
              height,
              const Divider(thickness: 0.2),
              height,
              Text(
                'Copyright 2023 GruChangThaiGoldSmith.Com',
                style: Theme.of(context).textTheme.smaller.copyWith(color: Colors.grey),
              ),
              height,
              Text(
                'Version: ${_packageInfo.version} build ${_packageInfo.buildNumber}',
                style: Theme.of(context).textTheme.smaller.copyWith(color: Colors.grey),
              ),
              height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildSocialIcons(),
              )
            ],
          ),
        ),
        spacing,
      ],
    );
  }

  Widget _buildFooterDesktopContent() {
    Widget spacing = const Expanded(flex: 1, child: Offstage());
    Widget height = const SizedBox(height: 20);

    return Row(
      children: [
        spacing,
        Expanded(
          flex: 20,
          child: Column(
            children: [
              spacing,
              Expanded(
                flex: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
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
                    _buildIconText(Icons.home_work, 'The Old Siam Plaza,\n2nd Floor, Zone Silk.'),
                    height,
                    _buildIconText(Icons.phone, '083-718-8850'),
                    height,
                    _buildIconText(Icons.phone, '083-459-7773'),
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
                        children: [
                          Expanded(
                            child: Text(
                              'Copyright 2023 GruChangThaiGoldSmith.Com',
                              style: Theme.of(context).textTheme.smaller.copyWith(color: Colors.grey),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Version: ${_packageInfo.version} build ${_packageInfo.buildNumber}',
                              style: Theme.of(context).textTheme.smaller.copyWith(color: Colors.grey),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: _buildSocialIcons(),
                              ),
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

  Widget _buildIconText(IconData icon, String text) {
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

  List<Widget> _buildSocialIcons() {
    return listSocialItems.map((socialItem) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Image.asset(socialItem.icon, height: 30),
            onPressed: () => UrlUtils.launchURL(socialItem.url),
          ),
        ],
      );
    }).toList();
  }
}
