import 'package:flutter/material.dart';
import 'package:toriishopping/src/common/presentation/functions/item_tap.dart';
import 'package:toriishopping/src/products/domain/entities/product.dart';

class ProductItemWidget extends StatelessWidget {
  final Product product;
  final ItemTap<Product> itemTap;

  ProductItemWidget({Key key, @required this.product, @required this.itemTap});

  @override
  Widget build(BuildContext context) {
    final size = 125.0;

    return new GestureDetector(
        onTap: () {
          itemTap(product);
        },
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Hero(
                  tag: product.name,
                  child: product.images.length > 0
                      ? Image.network(
                          product.images[0],
                          fit: BoxFit.contain,
                          height: size,
                          width: size,
                        )
                      : Image.asset(
                          'assets/images/empty_image.png',
                          height: size,
                          width: size,
                        ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(product.name,
                        style: Theme.of(context).textTheme.title),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
