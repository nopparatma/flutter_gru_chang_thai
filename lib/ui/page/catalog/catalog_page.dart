import 'package:flutter/material.dart';
import 'package:flutter_gru_chang_thai/ui/page/catalog/desktop/catalog_page.dart';
import 'package:flutter_gru_chang_thai/ui/page/catalog/mobile/catalog_page.dart';
import 'package:flutter_gru_chang_thai/ui/widget/responsive_widget.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  CatalogPageState createState() => CatalogPageState();
}

class CatalogPageState extends State<CatalogPage> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      desktop: DesktopCatalogPage(),
      mobile: MobileCatalogPage(),
    );
  }
}
