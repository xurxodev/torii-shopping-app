import 'package:flutter/material.dart';
import 'package:torii_shopping/src/banners/presentation/blocs/banners_bloc.dart';
import 'package:torii_shopping/src/banners/presentation/widgets/banner_list.dart';

import 'package:torii_shopping/src/common/blocs/BlocProvider.dart';
import 'package:torii_shopping/src/common/di/depdendencies_provider.dart';
import 'package:torii_shopping/src/common/torii_colors.dart';
import 'package:torii_shopping/src/home/widgets/home_toolbar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ToriiColors.transparent,
      body: Column(
        children: <Widget>[
          HomeToolbar(),
          Expanded(
            child: BlocProvider<BannersBloc>(
              bloc: DependenciesProvider.provideBannersBloc(),
              child: BannerList(),
            ),
          )
        ],
      ),
    );
  }
}
