import 'package:flutter/material.dart';
import 'package:toriishopping/src/products/domain/entities/productPrice.dart';
import 'package:toriishopping/src/products/presentation/widgets/product_price_item_widget.dart';

class ProductPricesListWidget extends StatelessWidget {
  final List<ProductPrice> productPrices;

  ProductPricesListWidget(this.productPrices);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height: 10),
        itemCount: productPrices.length,
        itemBuilder: (context, index) {
          final productPrice = productPrices[index];

          return ProductPriceItemWidget(productPrice: productPrice);
        });
  }
}
