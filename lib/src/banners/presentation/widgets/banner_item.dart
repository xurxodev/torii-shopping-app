import 'package:flutter/material.dart';
import 'package:torii_shopping/src/Browser/presentation/screens/browser_screen.dart';
import 'package:torii_shopping/src/banners/domain/banner.dart' as toriiBanner;

class BannerItem extends StatelessWidget {
  final toriiBanner.Banner banner;

  BannerItem({Key key, @required this.banner});

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
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            child: Image.network(
              banner.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}
