import 'package:flutter/material.dart';
import 'package:flutter_gru_chang_thai/app/app_resource.dart';
import 'package:flutter_gru_chang_thai/shared/theme.dart';
import 'package:flutter_gru_chang_thai/ui/widget/custom_carousel_widget.dart';
import 'package:flutter_gru_chang_thai/ui/widget/gold_gradient_box_item_widget.dart';
import 'package:flutter_gru_chang_thai/ui/widget/gold_gradient_text_widget.dart';
import 'package:flutter_gru_chang_thai/ui/widget/header_widget.dart';
import 'package:get/get.dart';

class CarouselDisplayItem {
  final String title;
  final List<Widget> listWidgets;

  CarouselDisplayItem({required this.title, required this.listWidgets});
}

class MobileCatalogPage extends StatefulWidget {
  const MobileCatalogPage({super.key});

  @override
  MobileCatalogPageState createState() => MobileCatalogPageState();
}

class MobileCatalogPageState extends State<MobileCatalogPage> {
  List<CarouselDisplayItem> mainLists = [
    CarouselDisplayItem(
      title: 'สร้อยคอทองโบราณ',
      listWidgets: const [
        GoldGradientBoxItemWidget(),
        GoldGradientBoxItemWidget(),
      ],
    ),
    CarouselDisplayItem(
      title: 'สร้อยข้อมือทองโบราณ',
      listWidgets: const [
        GoldGradientBoxItemWidget(),
        GoldGradientBoxItemWidget(),
      ],
    ),
    CarouselDisplayItem(
      title: 'กรอบพระทองโบราณ',
      listWidgets: const [
        GoldGradientBoxItemWidget(),
        GoldGradientBoxItemWidget(),
      ],
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderWidget(
          title: AppResource.antique.tr,
          fromPage: AppResource.home.tr,
        ),
        const SizedBox(height: 32), // Consistent spacing after HeaderWidget
        ..._buildContentList(), // Use a method to build the list content
      ],
    );
  }

  List<Widget> _buildContentList() {
    return List.generate(mainLists.length, (index) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 64), // Consistent padding between items
        child: _buildContent(mainLists[index], index),
      );
    });
  }

  Widget _buildContent(CarouselDisplayItem item, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GoldGradientTextWidget(
          text: item.title,
          style: Theme.of(context).textTheme.xLarger,
        ),
        const SizedBox(height: 32), // Consistent spacing between text and carousel
        CustomCarouselWidget(key: Key('$index'), listWidgets: item.listWidgets),
      ],
    );
  }
}
