import 'package:flutter/material.dart';
import 'package:flutter_gru_chang_thai/shared/colors.dart';
import 'package:flutter_gru_chang_thai/shared/theme.dart';
import 'package:flutter_gru_chang_thai/ui/widget/background_image_widget.dart';
import 'package:flutter_gru_chang_thai/ui/widget/fade_animation_widget.dart';
import 'package:flutter_gru_chang_thai/ui/widget/footer_widget.dart';
import 'package:flutter_gru_chang_thai/ui/widget/menu_top_bar_widget.dart';
import 'package:flutter_gru_chang_thai/utils/url_utils.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:responsive_framework/responsive_framework.dart';

class CommonLayout extends StatefulWidget {
  final Widget child;

  const CommonLayout({
    required this.child,
    super.key,
  });

  @override
  CommonLayoutState createState() => CommonLayoutState();
}

class CommonLayoutState extends State<CommonLayout> {
  List<Widget> listMenuWidgets = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBackground,
      body: Stack(
        children: [
          FadeAnimationWidget(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView(
                    physics: const ClampingScrollPhysics(),
                    children: [
                      widget.child,
                      const FooterWidget(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const MenuTopBarWidget(),
        ],
      ),
    );
  }
}
