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
        height: 200.0,
        child: Carousel(
            boxFit: BoxFit.fill,
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
}
