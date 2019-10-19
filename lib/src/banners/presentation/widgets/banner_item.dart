import 'package:flutter/material.dart';
import 'package:torii_shopping/src/Browser/presentation/screens/browser_screen.dart';
import 'package:torii_shopping/src/banners/domain/entities/banner.dart' as toriiBanner;

class BannerItem extends StatelessWidget {
  final toriiBanner.Banner banner;
  final BorderRadius borderRadius;

  BannerItem(
      {Key key, @required this.banner, this.borderRadius = BorderRadius.zero});

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      BrowserScreen(
                        url: banner.linkUrl,
                      )));
        },
        child: ClipRRect(
          borderRadius: borderRadius,
          child: Container(
            child: Image.network(
              banner.imageUrl,
              fit: BoxFit.fitHeight,
            ),
          ),
        ));
  }
}
