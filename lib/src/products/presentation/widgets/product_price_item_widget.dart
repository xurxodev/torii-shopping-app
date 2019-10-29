import 'package:flutter/material.dart';
import 'package:toriishopping/src/browser/presentation/blocs/browser_bloc.dart';
import 'package:toriishopping/src/browser/presentation/screens/browser_screen.dart';
import 'package:toriishopping/src/common/di/depdendencies_provider.dart';
import 'package:toriishopping/src/common/presentation/blocs/BlocProvider.dart';
import 'package:toriishopping/src/products/domain/entities/productPrice.dart';
import 'package:toriishopping/src/common/presentation/navigator/default_navigator.dart';

class ProductPriceItemWidget extends StatelessWidget {
  final ProductPrice productPrice;

  ProductPriceItemWidget({Key key, @required this.productPrice});

  @override
  Widget build(BuildContext context) {
    final List<Widget> _priceContent = [Image.network(productPrice.storeImage)];

    if (productPrice.price.isNotEmpty) {
      _priceContent.add(Text(
        "${productPrice.price} €",
        style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
      ));
    }

    WidgetBuilder browserBuilder = BrowserRoute(productPrice.url).builder();

    return new GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: browserBuilder));
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
              children: _priceContent,
            )));
  }
}
