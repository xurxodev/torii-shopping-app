import 'package:flutter/material.dart';
import 'package:torii_shopping/src/products/domain/entities/productPrice.dart';
import 'package:torii_shopping/src/products/presentation/widgets/product_price_item.dart';

class ProductPricesList extends StatelessWidget {
  final List<ProductPrice> productPrices;

  ProductPricesList(this.productPrices);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height: 10),
        itemCount: productPrices.length,
        itemBuilder: (context, index) {
          final productPrice = productPrices[index];

          return ProductPriceItem(productPrice: productPrice);
        });
  }
}
