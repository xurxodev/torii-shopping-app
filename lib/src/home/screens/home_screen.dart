import 'package:flutter/material.dart';
import 'package:toriishopping/src/banners/presentation/blocs/banners_bloc.dart';
import 'package:toriishopping/src/banners/presentation/widgets/banner_list_widget.dart';
import 'package:toriishopping/src/common/di/depdendencies_provider.dart';
import 'package:toriishopping/src/common/presentation/blocs/BlocProvider.dart';
import 'package:toriishopping/src/common/torii_colors.dart';
import 'package:toriishopping/src/home/widgets/home_toolbar_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ToriiColors.transparent,
      body: Column(
        children: <Widget>[
          HomeToolbarWidget(),
          Expanded(
            child: BlocProvider<BannersBloc>(
              bloc: DependenciesProvider.provideBannersBloc(),
              child: BannerListWidget(),
            ),
          )
        ],
      ),
    );
  }
}
