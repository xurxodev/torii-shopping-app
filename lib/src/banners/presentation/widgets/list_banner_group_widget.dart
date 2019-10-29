import 'package:flutter/material.dart';
import 'package:toriishopping/src/banners/domain/entities/banner_group.dart';
import 'package:toriishopping/src/common/presentation/functions/item_tap.dart';
import 'package:toriishopping/src/banners/domain/entities/banner.dart'
    as MyBanners;
import 'banner_item_widget.dart';

class ListBannerGroupWidget extends StatelessWidget {
  final BannerGroup bannerGroup;
  final bool isHorizontal;
  final ItemTap<MyBanners.Banner> itemTap;

  ListBannerGroupWidget(
      {Key key,
      @required this.bannerGroup,
      this.isHorizontal = true,
      @required this.itemTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
            title: Text(bannerGroup.name,
                style: Theme.of(context).textTheme.title)),
        Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: SizedBox(
                height: 200.0,
                child: ListView(
                    scrollDirection:
                        isHorizontal ? Axis.horizontal : Axis.vertical,
                    children: bannerGroup.banners
                        .map((banner) => Padding(
                              padding: EdgeInsets.only(left: 4, right: 4),
                              child: BannerItemWidget(
                                banner: banner,
                                borderRadius: BorderRadius.circular(20.0),
                                padding: EdgeInsets.all(2.0),
                                itemTap: itemTap,
                              ),
                            ))
                        .toList())))
      ],
    );
  }
}
