import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gru_chang_thai/app/app_resource.dart';
import 'package:flutter_gru_chang_thai/shared/colors.dart';
import 'package:flutter_gru_chang_thai/shared/theme.dart';
import 'package:flutter_gru_chang_thai/ui/common_layout.dart';
import 'package:flutter_gru_chang_thai/ui/router.dart';
import 'package:flutter_gru_chang_thai/ui/widget/custom_text_field_widget.dart';
import 'package:flutter_gru_chang_thai/ui/widget/gold_gradient_button_widget.dart';
import 'package:flutter_gru_chang_thai/ui/widget/header_widget.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      isShowBodyByScroll: false,
      menuRouteSelect: RoutePaths.catalogPage,
      header: (scrollController) => HeaderWidget(
        title: AppResource.antique.tr(),
        fromPage: AppResource.home.tr(),
      ),
      name: AppResource.antique.tr(),
      body: Container(),
    );
  }
}
