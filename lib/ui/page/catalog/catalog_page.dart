import 'package:flutter/material.dart';
import 'package:flutter_gru_chang_thai/ui/page/catalog/desktop/catalog_page.dart';
import 'package:flutter_gru_chang_thai/ui/page/catalog/mobile/catalog_page.dart';
import 'package:flutter_gru_chang_thai/ui/widget/responsive_widget.dart';
import 'package:flutter_gru_chang_thai/utils/argument_util.dart';
import 'package:get/get.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  CatalogPageState createState() => CatalogPageState();
}

class CatalogPageState extends State<CatalogPage> {
  @override
  void initState() {
    super.initState();

    final type = ArgumentUtils.getArgument<String>('type', defaultValue: '');
    debugPrint('SOYACHT $type');
  }

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      desktop: DesktopCatalogPage(),
      mobile: MobileCatalogPage(),
    );
  }
}
