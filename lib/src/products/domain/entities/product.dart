import 'productPrice.dart';

class Product{
  final String asin;
  final String description;
  final String ean;
  final List<String> images;
  final String name;
  final String upc;
  final String url;
  final List<ProductPrice> prices;

  Product(this.asin, this.description, this.ean, this.images, this.name,
      this.upc, this.url, this.prices);
}