import 'package:flutter/material.dart';
import 'package:toriishopping/src/banners/domain/entities/banner_group.dart';
import 'package:toriishopping/src/banners/domain/entities/banner_group_type.dart';
import 'package:toriishopping/src/banners/presentation/blocs/banners_bloc.dart';
import 'package:toriishopping/src/banners/presentation/widgets/list_banner_group_widget.dart';
import 'package:toriishopping/src/common/presentation/blocs/BlocProvider.dart';
import 'package:toriishopping/src/common/presentation/snackbar.dart';

import 'carousel_banner_group_widget.dart';

class BannerListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BannersBloc bloc = BlocProvider.of<BannersBloc>(context);

    return StreamBuilder<List<BannerGroup>>(
      stream: bloc.banners,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return buildBannerGroups(context, snapshot.data);
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
      BuildContext context, List<BannerGroup> bannerGroups) {
    List<Widget> children = new List();

    bannerGroups.forEach((group) => {
          if (group.type == BannerGroupType.carousel)
            {children.add(CarouselBannerGroupWidget(bannerGroup: group))}
          else
            {
              children.add(ListBannerGroupWidget(
                  bannerGroup: group,
                  isHorizontal: group.type == BannerGroupType.horizontalList))
            }
        });

    return ListView(
        padding: EdgeInsets.only(bottom: 16.0),
        scrollDirection: Axis.vertical,
        children: children);
  }
}
