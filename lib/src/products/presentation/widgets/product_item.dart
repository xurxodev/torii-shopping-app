import 'package:flutter/material.dart';
import 'package:torii_shopping/src/Browser/presentation/screens/browser_screen.dart';
import 'package:torii_shopping/src/products/domain/entities/product.dart';
import 'package:torii_shopping/src/products/presentation/screens/product_screen.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem({Key key, @required this.product});

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            //builder: (context) => BrowserScreen(url: product.url),
            builder: (context) => ProductScreen(
              product: product,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            product.images.length > 0
                ? Hero(
                    tag: product.images[0],
                    child: Image.network(
                      product.images[0],
                      fit: BoxFit.contain,
                      height: 125,
                      width: 125,
                    ))
                : Column(),
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
    );
  }
}
