import 'package:flutter/material.dart';
import 'package:torii_shopping/src/products/domain/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem({Key key, @required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Image.network(
            product.images[0],
            fit: BoxFit.contain,
            height: 125,
            width: 125,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child:
                  Text(product.name, style: Theme.of(context).textTheme.title),
            ),
          )
        ],
      ),
    );
  }
}
