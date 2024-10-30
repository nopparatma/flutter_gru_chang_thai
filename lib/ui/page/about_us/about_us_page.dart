import 'package:flutter/material.dart';
import 'package:flutter_gru_chang_thai/ui/page/about_us/desktop/about_us_page.dart';
import 'package:flutter_gru_chang_thai/ui/page/about_us/mobile/about_us_page.dart';
import 'package:flutter_gru_chang_thai/ui/widget/responsive_widget.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  AboutUsPageState createState() => AboutUsPageState();
}

class AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      desktop: DesktopAboutUsPage(),
      mobile: MobileAboutUsPage(),
    );
  }
}
