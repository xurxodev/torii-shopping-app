import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:toriishopping/src/banners/domain/entities/banner_group.dart';
import 'package:toriishopping/src/common/presentation/widgets/functions.dart';

import 'banner_item_widget.dart';

class CarouselBannerGroupWidget extends StatelessWidget {
  final BannerGroup bannerGroup;
  final OnItemTapCallback onItemTap;

  CarouselBannerGroupWidget(
      {Key key, @required this.bannerGroup, @required this.onItemTap});

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
                      onItemTap: onItemTap,
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
