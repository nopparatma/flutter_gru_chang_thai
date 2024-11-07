import 'package:flutter/material.dart';
import 'package:flutter_gru_chang_thai/app/app_resource.dart';
import 'package:flutter_gru_chang_thai/shared/theme.dart';
import 'package:flutter_gru_chang_thai/ui/page/catalog/mock/mock_data.dart';
import 'package:flutter_gru_chang_thai/ui/page/catalog/model/catalog_display_item.dart';
import 'package:flutter_gru_chang_thai/ui/widget/custom_carousel_widget.dart';
import 'package:flutter_gru_chang_thai/ui/widget/gold_gradient_box_item_widget.dart';
import 'package:flutter_gru_chang_thai/ui/widget/gold_gradient_text_widget.dart';
import 'package:flutter_gru_chang_thai/ui/widget/header_widget.dart';
import 'package:get/get.dart';

class MobileCatalogPage extends StatefulWidget {
  const MobileCatalogPage({super.key});

  @override
  MobileCatalogPageState createState() => MobileCatalogPageState();
}

class MobileCatalogPageState extends State<MobileCatalogPage> {
  List<CatalogDisplayMainItem> catalogDisplays = [];

  @override
  void initState() {
    super.initState();

    catalogDisplays = mockCatalogDisplays;
  }
  @override
  void dispose() {
    super.dispose();
  }

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
    return List.generate(catalogDisplays.length, (index) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 64), // Consistent padding between items
        child: _buildContent(catalogDisplays[index], index),
      );
    });
  }

  Widget _buildContent(CatalogDisplayMainItem item, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GoldGradientTextWidget(
          text: item.title,
          style: Theme.of(context).textTheme.xLarger,
        ),
        const SizedBox(height: 32), // Consistent spacing between text and carousel
        CustomCarouselWidget(
          key: Key('$index'),
          listWidgets: item.products.map((e) => GoldGradientBoxItemWidget(image: e.image, title: e.title)).toList(),
        ),
      ],
    );
  }
}
