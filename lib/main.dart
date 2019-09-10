import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:torii_shopping/src/banner/domain/usecases/get_banners.dart';
import 'package:torii_shopping/src/search/presentation/screens/search_screen.dart';

import 'src/banner/data/banner_network_repository.dart';
import 'src/common/torii_colors.dart';
import 'package:torii_shopping/src/banner/domain/banner.dart' as Banner;

void main() {
  BannerNetworkRepository repository = new BannerNetworkRepository();
  GetBannersUseCase getBannersUseCase = new GetBannersUseCase(repository);

  runApp(MyApp( banners: getBannersUseCase.execute()));
}

class MyApp extends StatelessWidget {
  final Future<Map<String, List<Banner.Banner>>> banners;

  MyApp({Key key, this.banners}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Torii Shopping',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: ToriiColors.transparent,
        ),
        home: SearchScreen(banners)
    );
  }
}
