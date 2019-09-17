import 'package:flutter/material.dart';
import 'package:torii_shopping/src/banners/domain/banner.dart' as MyBanner;
import 'package:torii_shopping/src/banners/presentation/blocs/banners_bloc.dart';
import 'package:torii_shopping/src/common/blocs/BlocProvider.dart';
import 'banner_item.dart';

class BannerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BannersBloc bloc = BlocProvider.of<BannersBloc>(context);

    return StreamBuilder<Map<String, List<MyBanner.Banner>>>(
      stream: bloc.banners,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return buildBannerGroups(context, snapshot.data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        return Center(
            child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget buildBannerGroups(
      BuildContext context, Map<String, List<MyBanner.Banner>> bannerGroups) {
    List<Widget> children = new List();

    bannerGroups.forEach((group, banners) => {
          children.add(ListTile(
            title: Text(group, style: Theme.of(context).textTheme.title),
          )),
          children.add(
            Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              child: SizedBox(
                height: 200.0,
                child: ListView(
                  //physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: banners
                      .map(
                        (banner) => Padding(
                          padding: EdgeInsets.only(left: 4, right: 4),
                          child: BannerItem(pathImage: banner.imageUrl),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          )
        });

    return ListView(scrollDirection: Axis.vertical, children: children);
  }
}
