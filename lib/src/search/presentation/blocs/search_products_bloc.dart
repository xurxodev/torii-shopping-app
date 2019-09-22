import 'dart:async';
import 'package:torii_shopping/src/common/blocs/bloc_base.dart';
import 'package:torii_shopping/src/common/domain/page_result.dart';
import 'package:torii_shopping/src/products/domain/entities/product.dart';
import 'package:torii_shopping/src/products/domain/usecases/get_products.dart';
import 'package:torii_shopping/src/search/presentation/state/search_products_state.dart';
import 'package:torii_shopping/src/suggestions/domain/usecases/get_suggestions.dart';

class SearchProductsBloc implements BlocBase {
  GetProductsUseCase _getProductsUseCase;
  GetSuggestionsUseCase _getSuggestionsUseCase;

  final _resultsController = StreamController<SearchProductsState>.broadcast();
  final _queryController = StreamController<String>.broadcast();

  String _query;

  StreamSink<String> get query => _queryController.sink;

  SearchProductsState _state;

  Stream<SearchProductsState> get state => _resultsController.stream;

  bool _searching = false;

  SearchProductsBloc(this._getProductsUseCase, this._getSuggestionsUseCase) {
    _queryController.stream.listen((q) {
      _query = q;

      loadSuggestions(_query);
    });
  }

  void performSearch(String query, int page) async {
    if (!_searching) {
      _searching = true;

      if (page == 1) {
        _state = SearchProductsState.empty();
      }

      var productsPage = await _getProductsUseCase.execute(query, page);

      var totalItems = new List<Product>();
      totalItems.addAll(_state.result.items);
      totalItems.addAll(productsPage.items);

      _state = new SearchProductsState(
          false,
          PageResult(totalItems, productsPage.page, productsPage.totalPages),
          new List());

      _resultsController.sink.add(_state);

      _searching = false;
    }
  }

  void loadSuggestions(String prefix) async {
    _state = SearchProductsState.empty();

    final suggestions = await _getSuggestionsUseCase.execute(prefix);

    _state = new SearchProductsState(false, _state.result, suggestions);

    _resultsController.sink.add(_state);
  }

  @override
  void dispose() {
    _resultsController.close();
    _queryController.close();
  }

  void loadMoreData() {
    if (_state.result.page < _state.result.totalPages) {
      _state = new SearchProductsState(true, _state.result, _state.suggestions);
      _resultsController.sink.add(_state);
      performSearch(_query, _state.result.page + 1);
    }
  }
}
