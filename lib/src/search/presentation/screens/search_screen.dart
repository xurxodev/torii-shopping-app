import 'package:flutter/material.dart';
import 'package:torii_shopping/src/banner/domain/banner.dart' as MyBanner;
import 'package:torii_shopping/src/common/torii_colors.dart';
import 'package:torii_shopping/src/search/presentation/widgets/search_item.dart';
import 'package:torii_shopping/src/search/presentation/widgets/search_toolbar.dart';

class SearchScreen extends StatelessWidget {
  final Future<Map<String, List<MyBanner.Banner>>> banners;

  SearchScreen(this.banners);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ToriiColors.transparent,
      body: Column(
        children: <Widget>[
          SearchToolbar(),
          Expanded(
              child: FutureBuilder<Map<String, List<MyBanner.Banner>>>(
            future: banners,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return buildBannerGroups(context, snapshot.data);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              return CircularProgressIndicator();
            },
          ))
        ],
      ),
    );
  }
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
                        child: SearchItem(pathImage: banner.imageUrl),
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
