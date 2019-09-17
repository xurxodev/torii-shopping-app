import 'dart:async';
import 'package:torii_shopping/src/common/blocs/bloc_base.dart';
import 'package:torii_shopping/src/products/domain/product.dart';
import 'package:torii_shopping/src/products/domain/usecases/get_products.dart';

class SearchProductsBloc implements BlocBase {
  GetProductsUseCase _getProductsUseCase;

  final _resultsController = StreamController<List<Product>>.broadcast();
  final _queryController = StreamController<String>.broadcast();

  StreamSink<String> get query => _queryController.sink;

  Stream<List<Product>> get results => _resultsController.stream;

  String _query = "";

  SearchProductsBloc(this._getProductsUseCase) {
    _queryController.stream.listen((q) => _performSearch(q));
  }

  _performSearch(String query) async {
    if (_query != query) {
      _query = query;

      var products = await _getProductsUseCase.execute(query);

      _resultsController.sink.add(products);
    }
  }

  @override
  void dispose() {
    _resultsController.close();
    _queryController.close();
  }
}
