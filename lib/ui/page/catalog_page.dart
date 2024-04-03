import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gru_chang_thai/app/app_resource.dart';
import 'package:flutter_gru_chang_thai/shared/theme.dart';
import 'package:flutter_gru_chang_thai/ui/widget/fade_animation_widget.dart';
import 'package:flutter_gru_chang_thai/ui/widget/gold_gradient_text_widget.dart';
import 'package:flutter_gru_chang_thai/ui/widget/header_widget.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  CatalogPageState createState() => CatalogPageState();
}

class CatalogPageState extends State<CatalogPage> {
  @override
  Widget build(BuildContext context) {
    return FadeAnimationWidget(
      child: Column(
        children: [
          HeaderWidget(
            title: AppResource.antique.tr(),
            fromPage: AppResource.home.tr(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GoldGradientTextWidget(
                  text: AppResource.antique.tr(),
                  style: Theme.of(context).textTheme.xxLarger,
                ),
                const SizedBox(height: 40),
                Row(
                  children: [
                    const Expanded(flex: 1, child: Offstage()),
                    Expanded(
                      flex: 10,
                      child: Container(
                        height: 500,
                      ),
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
}
