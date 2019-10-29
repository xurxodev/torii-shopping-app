import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:toriishopping/src/banners/domain/entities/banner_group.dart';

import 'banner_item_widget.dart';
import 'package:toriishopping/src/banners/domain/entities/banner.dart'
    as MyBanners;
import 'package:toriishopping/src/common/presentation/functions/item_tap.dart';

class CarouselBannerGroupWidget extends StatelessWidget {
  final BannerGroup bannerGroup;
  final ItemTap<MyBanners.Banner> itemTap;

  CarouselBannerGroupWidget(
      {Key key, @required this.bannerGroup, @required this.itemTap});

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
                      itemTap: itemTap,
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
