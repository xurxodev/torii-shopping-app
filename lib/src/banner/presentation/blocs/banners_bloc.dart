import 'dart:async';

import 'package:torii_shopping/src/banner/domain/banner.dart';
import 'package:torii_shopping/src/banner/domain/usecases/get_banners.dart';
import 'package:torii_shopping/src/common/blocs/bloc_base.dart';

class BannersBloc implements BlocBase{
  GetBannersUseCase _getBannersUseCase;

  final _bannersController = StreamController<Map<String, List<Banner>>>();
  Stream<Map<String, List<Banner>>> get banners => _bannersController.stream;

  BannersBloc(this._getBannersUseCase);

  init() async {
    var banners = await _getBannersUseCase.execute();

    _bannersController.sink.add(banners);
  }

  @override
  void dispose() {
    _bannersController.close();
  }

}