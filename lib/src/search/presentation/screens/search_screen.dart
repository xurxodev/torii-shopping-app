import 'package:flutter/material.dart';
import 'package:torii_shopping/src/banner/data/banner_network_repository.dart';
import 'package:torii_shopping/src/banner/domain/usecases/get_banners.dart';
import 'package:torii_shopping/src/banner/presentation/blocs/banners_bloc.dart';
import 'package:torii_shopping/src/banner/presentation/widgets/banner_list.dart';
import 'package:torii_shopping/src/common/blocs/BlocProvider.dart';
import 'package:torii_shopping/src/common/torii_colors.dart';
import 'package:torii_shopping/src/search/presentation/widgets/search_toolbar.dart';

class SearchScreen extends StatelessWidget {
  BannersBloc bannersBloc;

  SearchScreen() {
    BannerNetworkRepository repository = new BannerNetworkRepository();
    GetBannersUseCase getBannersUseCase = new GetBannersUseCase(repository);
    bannersBloc = new BannersBloc(getBannersUseCase);

    bannersBloc.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ToriiColors.transparent,
      body: Column(
        children: <Widget>[
          SearchToolbar(),
          Expanded(
            child: BlocProvider<BannersBloc>(
              bloc: bannersBloc,
              child: BannerList(),
            ),
          )
        ],
      ),
    );
  }
}
