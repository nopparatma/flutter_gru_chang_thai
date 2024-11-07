class CatalogDisplayMainItem {
  final String title;
  final List<CatalogDisplayItem> products;

  CatalogDisplayMainItem({required this.title, required this.products});
}

class CatalogDisplayItem {
  final String image;
  final String title;

  CatalogDisplayItem({required this.image, required this.title});
}
