import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:torii_shopping/src/common/torii_colors.dart';
import 'package:torii_shopping/src/products/domain/entities/product.dart';
import 'package:torii_shopping/src/products/presentation/widgets/product_prices_list.dart';

class ProductScreen extends StatelessWidget {
  final Product product;

  const ProductScreen({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: _content(context)),
    );
  }

  Widget _content(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return Column(children: <Widget>[_header(context), _body(context)]);
    } else {
      return Row(children: <Widget>[_header(context), _body(context)]);
    }
  }

  Widget _header(BuildContext context) {
    return Expanded(
        child: Stack(
      children: <Widget>[
        Positioned.fill(
            child: Container(
          margin: EdgeInsets.all(30.0),
          child: Hero(
            tag: product.images[0],
            child: Carousel(
                boxFit: BoxFit.scaleDown,
                dotBgColor: Colors.transparent,
                dotIncreasedColor: Colors.lightBlueAccent,
                dotColor: Colors.blue,
                dotVerticalPadding: -20,
                autoplay: false,
                images: product.images
                    .map((image) => NetworkImage(image))
                    .toList()),
          ),
        )),
        Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.blue,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        )
      ],
    ));
  }

  Widget _body(BuildContext context) {
    const padding = 25.0;

    return Expanded(
      child: Container(
        padding: EdgeInsets.only(
            top: padding, left: padding, right: padding, bottom: padding),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -5),
              blurRadius: 5,
              color: Colors.black26,
            )
          ],
          borderRadius: _bodyBorderRadius(context),
          gradient: ToriiColors.backgroundGradient,
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 16.0, bottom: 32.0),
              child: Text(
                product.name,
                style: TextStyle(fontSize: 21, color: Colors.white),
              ),
            ),
            Expanded(child: Center(child: ProductPricesList(product.prices))),
          ],
        ),
      ),
    );
  }

  BorderRadius _bodyBorderRadius(BuildContext context) {
    const Radius radius = Radius.circular(55);

    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return BorderRadius.only(topLeft: radius, topRight: radius);
    } else {
      return BorderRadius.only(topLeft: radius, bottomLeft: radius);
    }
  }
}
