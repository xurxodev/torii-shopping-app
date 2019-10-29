import 'package:flutter/material.dart';
import 'package:toriishopping/src/banners/domain/entities/banner.dart'
    as toriiBanner;
import 'package:toriishopping/src/common/presentation/functions/item_tap.dart';

class BannerItemWidget extends StatelessWidget {
  final toriiBanner.Banner banner;
  final BorderRadius borderRadius;
  final EdgeInsets padding;
  final ItemTap<toriiBanner.Banner> itemTap;

  BannerItemWidget(
      {Key key,
      @required this.banner,
      this.borderRadius = BorderRadius.zero,
      this.padding = EdgeInsets.zero,
      @required this.itemTap});

  @override
  Widget build(BuildContext context) {
    //WidgetBuilder browserBuilder = BrowserRoute(banner.linkUrl).builder();

    return new GestureDetector(
        onTap: () {
          itemTap(banner);
          //Navigator.push(context, MaterialPageRoute(builder: browserBuilder));
        },
        child: Container(
            padding: padding,
            decoration: BoxDecoration(
                color: Colors.grey[50], borderRadius: borderRadius),
            child: ClipRRect(
              borderRadius: borderRadius,
              child: Image.network(
                banner.imageUrl,
                fit: BoxFit.fitHeight,
              ),
            )));
  }
}
