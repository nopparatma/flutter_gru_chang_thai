import 'package:flutter/material.dart';
import 'package:flutter_gru_chang_thai/shared/theme.dart';
import 'package:flutter_gru_chang_thai/ui/router.dart';
import 'package:flutter_gru_chang_thai/ui/widget/gold_gradient_box_item_widget.dart';
import 'package:flutter_gru_chang_thai/ui/widget/banner_home_widget.dart';
import 'package:flutter_gru_chang_thai/ui/widget/gold_gradient_text_widget.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class MainMenuItem {
  String image;
  String title;
  String type;
  Function? onTap;

  MainMenuItem({
    required this.image,
    required this.title,
    required this.type,
    this.onTap,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  AutoScrollController scrollController = AutoScrollController();

  List<MainMenuItem> listMainMenus = [
    MainMenuItem(image: '', title: 'กำไล', type: 'BRACELETS'),
    MainMenuItem(image: '', title: 'สร้อยคอ', type: 'NECKLACE'),
    MainMenuItem(image: '', title: 'แหวน', type: 'RINGS'),
    MainMenuItem(image: '', title: 'ปิ่น', type: 'PIN'),
    MainMenuItem(image: '', title: 'ต่างหู', type: 'EARRINGS'),
    MainMenuItem(image: '', title: 'ผอบ', type: 'PA_OP'),
  ];

  @override
  void initState() {
    super.initState();
  }

  _onTapItem(MainMenuItem item) {
    Get.toNamed(RoutePath.catalogPage, arguments: {'type': item.type});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BannerHomeWidget(scrollController: scrollController),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Column(
            children: [
              GoldGradientTextWidget(
                text: 'ทองโบราณ ทองเพชรบุรี', //AppResource.home.tr,
                style: Theme.of(context).textTheme.xxLarger,
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  const Expanded(flex: 1, child: Offstage()),
                  Expanded(
                    flex: 20,
                    child: _buildContent(),
                  ),
                  const Expanded(flex: 1, child: Offstage()),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContent() {
    if (ResponsiveBreakpoints.of(context).isDesktop) {
      return _buildDesktopView();
    }

    return _buildMobileView();
  }

  Widget _buildDesktopView() {
    return _buildGridView(
      crossAxisCount: 3,
      mainAxisSpacing: 50,
      crossAxisSpacing: 50,
    );
  }

  Widget _buildMobileView() {
    return _buildGridView(
      crossAxisCount: 1,
      mainAxisSpacing: 25,
      crossAxisSpacing: 25,
    );
  }

  Widget _buildGridView({
    required int crossAxisCount,
    required double mainAxisSpacing,
    required double crossAxisSpacing,
  }) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: crossAxisCount,
      mainAxisSpacing: mainAxisSpacing,
      crossAxisSpacing: crossAxisSpacing,
      children: listMainMenus
          .map(
            (e) => GoldGradientBoxItemWidget(
              image: e.image,
              title: e.title,
              onTap: () => _onTapItem(e),
            ),
          )
          .toList(),
    );
  }
}
