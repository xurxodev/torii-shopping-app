import 'package:flutter/material.dart';
import 'package:toriishopping/src/Browser/presentation/screens/browser_screen.dart';
import 'package:toriishopping/src/banners/domain/entities/banner.dart'
    as toriiBanner;
import 'package:toriishopping/src/browser/presentation/blocs/browser_bloc.dart';
import 'package:toriishopping/src/common/di/depdendencies_provider.dart';
import 'package:toriishopping/src/common/presentation/blocs/BlocProvider.dart';
import 'package:toriishopping/src/common/presentation/widgets/functions.dart';

class BannerItemWidget extends StatelessWidget {
  final toriiBanner.Banner banner;
  final BorderRadius borderRadius;
  final EdgeInsets padding;
  final OnItemTapCallback onItemTap;

  BannerItemWidget(
      {Key key,
      @required this.banner,
      this.borderRadius = BorderRadius.zero,
      this.padding = EdgeInsets.zero,
      @required this.onItemTap});

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onTap: () {
          onItemTap(banner);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BlocProvider<BrowserBloc>(
                      bloc: DependenciesProvider.provideBrowserBloc(),
                      child: BrowserScreen(url: banner.linkUrl))));
        },
        child: Container(
            padding: padding,
            decoration: BoxDecoration(
                color: Colors.grey[50], borderRadius: borderRadius),
            child: ClipRRect(
              borderRadius: borderRadius,
              child: Image.network(
                banner.imageUrl,
                fit: BoxFit.fitHeight,
              ),
            )));
  }
}
