import 'dart:async';

import 'package:toriishopping/src/banners/domain/entities/banner_group.dart';
import 'package:toriishopping/src/banners/domain/usecases/get_banners.dart';
import 'package:toriishopping/src/common/contracts/analytics_service.dart';
import 'package:toriishopping/src/common/presentation/blocs/bloc_base.dart';

class HomeBloc implements BlocBase{
  static const screen_name = "Home";
  AnalyticsService _analyticsService;

  GetBannersUseCase _getBannersUseCase;

  final _bannersController = StreamController<List<BannerGroup>>();
  Stream<List<BannerGroup>> get banners => _bannersController.stream;

  HomeBloc(this._analyticsService, this._getBannersUseCase){
    notifyAnalytics();
    init();
  }

  init() async {
    _getBannersUseCase.execute()
    .then((banners) => _bannersController.sink.add(banners))
    .catchError((error) => _bannersController.sink.addError(error));
  }

  @override
  void dispose() {
    _bannersController.close();
  }

  void notifyAnalytics() {
    _analyticsService.sendScreenName(screen_name);
  }

}