import 'dart:async';
import 'package:torii_shopping/src/common/blocs/bloc_base.dart';
import 'package:torii_shopping/src/common/domain/page_result.dart';
import 'package:torii_shopping/src/products/domain/product.dart';
import 'package:torii_shopping/src/products/domain/usecases/get_products.dart';

class SearchProductsBloc implements BlocBase {
  GetProductsUseCase _getProductsUseCase;

  final _resultsController = StreamController<PageResult<Product>>.broadcast();
  final _queryController = StreamController<String>.broadcast();

  StreamSink<String> get query => _queryController.sink;

  Stream<PageResult<Product>> get results => _resultsController.stream;

  bool _searching = false;

  SearchProductsBloc(this._getProductsUseCase) {
    _queryController.stream.listen((q) => _performSearch(q));
  }

  _performSearch(String query) async {
    if (!_searching) {
      _searching = true;

      var productsPage = await _getProductsUseCase.execute(query);

      _resultsController.sink.add(productsPage);
      _searching = false;
    }
  }

  @override
  void dispose() {
    _resultsController.close();
    _queryController.close();
  }
}
