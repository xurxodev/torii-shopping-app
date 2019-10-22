import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:torii_shopping/src/banners/domain/entities/banner_group.dart';

import 'banner_item_widget.dart';

class CarouselBannerGroupWidget extends StatelessWidget {
  final BannerGroup bannerGroup;

  CarouselBannerGroupWidget({Key key, @required this.bannerGroup});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: _height(context),
        child: Carousel(
            dotBgColor: Colors.transparent,
            dotIncreasedColor: Colors.lightBlueAccent,
            dotColor: Colors.blue,
            autoplay: true,
            images: bannerGroup.banners
                .take(10)
                .map((banner) => BannerItemWidget(
                      banner: banner,
                    ))
                .toList()));
  }

  double _height(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return MediaQuery.of(context).size.height * 0.25;
    } else {
      return MediaQuery.of(context).size.height * 0.50;
    }
  }
}
