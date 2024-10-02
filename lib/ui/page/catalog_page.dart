import 'package:flutter/material.dart';
import 'package:flutter_gru_chang_thai/app/app_resource.dart';
import 'package:flutter_gru_chang_thai/shared/theme.dart';
import 'package:flutter_gru_chang_thai/ui/widget/gold_gradient_box_item_widget.dart';
import 'package:flutter_gru_chang_thai/ui/widget/gold_gradient_text_widget.dart';
import 'package:flutter_gru_chang_thai/ui/widget/header_widget.dart';
import 'package:get/get.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  CatalogPageState createState() => CatalogPageState();
}

class CatalogPageState extends State<CatalogPage> {
  List<Widget> listWidgets = const [
    GoldGradientBoxItemWidget(),
    GoldGradientBoxItemWidget(),
    GoldGradientBoxItemWidget(),
    GoldGradientBoxItemWidget(),
    GoldGradientBoxItemWidget(),
    GoldGradientBoxItemWidget(),
  ];

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
            children: [
              _buildContent('สร้อยคอทองโบราณ'),
              _buildContent('สร้อยข้อมือทองโบราณ'),
              _buildContent('กรอบพระทองโบราณ'),
              _buildContent('จี้ทองโบราณ'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContent(String title) {
    return Column(
      children: [
        GoldGradientTextWidget(
          text: title,
          style: Theme.of(context).textTheme.xxLarger,
        ),
        const SizedBox(height: 32),
        Row(
          children: [
            const Expanded(flex: 1, child: Offstage()),
            Expanded(
              flex: 20,
              child: _buildDesktopView(),
            ),
            const Expanded(flex: 1, child: Offstage()),
          ],
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildDesktopView() {
    return SizedBox(
      height: 400,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listWidgets.length,
        prototypeItem: const SizedBox(width: 400),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(right: 16),
          child: listWidgets[index],
        ),
      ),
    );
  }
}
