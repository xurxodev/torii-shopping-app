import 'package:flutter/material.dart';
import 'package:torii_shopping/src/browser/presentation/screens/browser_screen.dart';
import 'package:torii_shopping/src/products/domain/entities/productPrice.dart';

class ProductPriceItem extends StatelessWidget {
  final ProductPrice productPrice;

  ProductPriceItem({Key key, @required this.productPrice});

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BrowserScreen(url: productPrice.url),
          ),
        );
      },
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              )),
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.network(productPrice.storeImage),
              Text("${productPrice.price} €",
                  style:
                  TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
            ],
          ))
    );
  }
}
