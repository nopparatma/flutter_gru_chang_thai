import 'package:flutter/material.dart';
import 'package:flutter_gru_chang_thai/app/app_resource.dart';
import 'package:flutter_gru_chang_thai/shared/theme.dart';
import 'package:flutter_gru_chang_thai/ui/page/catalog/mock/mock_data.dart';
import 'package:flutter_gru_chang_thai/ui/page/catalog/model/catalog_display_item.dart';
import 'package:flutter_gru_chang_thai/ui/widget/gold_gradient_box_item_widget.dart';
import 'package:flutter_gru_chang_thai/ui/widget/gold_gradient_text_widget.dart';
import 'package:flutter_gru_chang_thai/ui/widget/header_widget.dart';
import 'package:get/get.dart';

class DesktopCatalogPage extends StatefulWidget {
  const DesktopCatalogPage({super.key});

  @override
  DesktopCatalogPageState createState() => DesktopCatalogPageState();
}

class DesktopCatalogPageState extends State<DesktopCatalogPage> {
  List<CatalogDisplayMainItem> catalogDisplays = [];

  @override
  void initState() {
    super.initState();

    catalogDisplays = mockCatalogDisplays;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderWidget(
          title: AppResource.antique.tr,
          fromPage: AppResource.home.tr,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [..._buildContentList()],
          ),
        ),
      ],
    );
  }

  List<Widget> _buildContentList() {
    return List.generate(catalogDisplays.length, (index) => _buildContent(catalogDisplays[index]));
  }

  Widget _buildContent(CatalogDisplayMainItem mainItem) {
    return Column(
      children: [
        GoldGradientTextWidget(
          text: mainItem.title,
          style: Theme.of(context).textTheme.xxLarger,
        ),
        const SizedBox(height: 32),
        Row(
          children: [
            const Expanded(flex: 1, child: Offstage()),
            Expanded(
              flex: 20,
              child: _buildContentItemView(mainItem.products),
            ),
            const Expanded(flex: 1, child: Offstage()),
          ],
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildContentItemView(List<CatalogDisplayItem> listWidgets) {
    return SizedBox(
      height: 400,
      child: Center(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listWidgets.length,
          shrinkWrap: true,
          prototypeItem: const SizedBox(width: 400),
          itemBuilder: (context, index) {
            final item = listWidgets[index];
            return Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: GoldGradientBoxItemWidget(image: item.image, title: item.title),
              ),
            );
          },
        ),
      ),
    );
  }
}
