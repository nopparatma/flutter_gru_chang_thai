import 'package:flutter/material.dart';
import 'package:flutter_gru_chang_thai/ui/desktop/about_us_page.dart';
import 'package:flutter_gru_chang_thai/ui/mobile/about_us_page.dart';
import 'package:flutter_gru_chang_thai/ui/widget/fade_animation_widget.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  AboutUsPageState createState() => AboutUsPageState();
}

class AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return FadeAnimationWidget(
      child: _buildMainContent(),
    );
  }

  Widget _buildMainContent() {
    if (ResponsiveBreakpoints.of(context).isDesktop) {
      return const DesktopAboutUsPage();
    }

    return const MobileAboutUsPage();
  }
}
