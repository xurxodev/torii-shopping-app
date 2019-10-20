import 'package:flutter/material.dart';
import 'package:torii_shopping/src/Browser/presentation/screens/browser_screen.dart';
import 'package:torii_shopping/src/banners/domain/entities/banner.dart'
    as toriiBanner;

class BannerItemWidget extends StatelessWidget {
  final toriiBanner.Banner banner;
  final BorderRadius borderRadius;
  final EdgeInsets padding;

  BannerItemWidget(
      {Key key,
      @required this.banner,
      this.borderRadius = BorderRadius.zero,
      this.padding = EdgeInsets.zero});

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BrowserScreen(
                        url: banner.linkUrl,
                      )));
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
