import 'package:flutter/material.dart';
import 'package:toriishopping/src/banners/domain/entities/banner.dart'
    as MyBanners;
import 'package:toriishopping/src/banners/domain/entities/banner_group.dart';
import 'package:toriishopping/src/banners/domain/entities/banner_group_type.dart';
import 'package:toriishopping/src/banners/presentation/widgets/list_banner_group_widget.dart';
import 'package:toriishopping/src/common/presentation/blocs/BlocProvider.dart';
import 'package:toriishopping/src/common/presentation/snackbar.dart';
import 'package:toriishopping/src/common/presentation/widgets/functions.dart';
import 'package:toriishopping/src/home/presentation/blocs/home_bloc.dart';

import 'carousel_banner_group_widget.dart';

class BannerListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeBloc bloc = BlocProvider.of<HomeBloc>(context);

    return StreamBuilder<List<BannerGroup>>(
      stream: bloc.banners,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return buildBannerGroups(context, snapshot.data, bloc);
        } else if (snapshot.hasError) {
          showSnackBarPostFrame(context, snapshot.error.toString());
          return Container();
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget buildBannerGroups(
      BuildContext context, List<BannerGroup> bannerGroups, HomeBloc bloc) {
    List<Widget> children = new List();

/*
    OnItemTapCallback<MyBanners.Banner> onItemTap = (MyBanners.Banner banner) {
      BannerGroup bannerGroup = bannerGroups.firstWhere(
          (BannerGroup bannerGroup) => bannerGroup.banners.contains(banner));

      bloc.selectBanner(bannerGroup.type, banner);
    };
*/

    final onItemTap = (item) => selectBanner(bannerGroups, item, bloc);

    bannerGroups.forEach((group) => {
          if (group.type == BannerGroupType.carousel)
            {
              children.add(CarouselBannerGroupWidget(
                bannerGroup: group,
                onItemTap: onItemTap,
              ))
            }
          else
            {
              children.add(ListBannerGroupWidget(
                bannerGroup: group,
                isHorizontal: group.type == BannerGroupType.horizontalList,
                onItemTap: onItemTap,
              ))
            }
        });

    return ListView(
        padding: EdgeInsets.only(bottom: 16.0),
        scrollDirection: Axis.vertical,
        children: children);
  }

  void selectBanner(
      List<BannerGroup> bannerGroups, MyBanners.Banner banner, HomeBloc bloc) {
    BannerGroup bannerGroup = bannerGroups.firstWhere(
        (BannerGroup bannerGroup) => bannerGroup.banners.contains(banner));

    bloc.selectBanner(bannerGroup.type, banner);
  }
}
