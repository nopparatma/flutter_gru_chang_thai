import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gru_chang_thai/app/app_resource.dart';
import 'package:flutter_gru_chang_thai/shared/theme.dart';
import 'package:flutter_gru_chang_thai/ui/widget/fade_animation_widget.dart';
import 'package:flutter_gru_chang_thai/ui/widget/gold_gradient_box_item_widget.dart';
import 'package:flutter_gru_chang_thai/ui/widget/banner_home_widget.dart';
import 'package:flutter_gru_chang_thai/ui/widget/gold_gradient_text_widget.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  AutoScrollController scrollController = AutoScrollController();

  List<Widget> listWidgets = const [
    GoldGradientBoxItemWidget(),
    GoldGradientBoxItemWidget(),
    GoldGradientBoxItemWidget(),
    GoldGradientBoxItemWidget(),
    GoldGradientBoxItemWidget(),
    GoldGradientBoxItemWidget(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FadeAnimationWidget(
      child: Column(
        children: [
          BannerHomeWidget(scrollController: scrollController),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Column(
              children: [
                GoldGradientTextWidget(
                  text: AppResource.home.tr(),
                  style: Theme.of(context).textTheme.xxLarger,
                ),
                const SizedBox(height: 40),
                Row(
                  children: [
                    const Expanded(flex: 1, child: Offstage()),
                    Expanded(
                      flex: 10,
                      child: _buildContent(),
                    ),
                    const Expanded(flex: 1, child: Offstage()),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    if (ResponsiveBreakpoints.of(context).isDesktop) {
      return _buildDesktopView();
    }

    return _buildMobileView();
  }

  Widget _buildDesktopView() {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 3,
      mainAxisSpacing: 50,
      crossAxisSpacing: 50,
      children: listWidgets,
    );
  }

  Widget _buildMobileView() {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 1,
      mainAxisSpacing: 25,
      crossAxisSpacing: 25,
      children: listWidgets,
    );
  }
}
