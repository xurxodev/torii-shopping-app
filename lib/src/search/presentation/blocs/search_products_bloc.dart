import 'dart:async';
import 'package:toriishopping/src/common/contracts/analytics_service.dart';
import 'package:toriishopping/src/common/contracts/routes_navigator.dart';
import 'package:toriishopping/src/common/domain/page_result.dart';
import 'package:toriishopping/src/common/presentation/blocs/bloc_base.dart';
import 'package:toriishopping/src/common/presentation/navigator/default_navigator.dart';
import 'package:toriishopping/src/products/domain/entities/product.dart';
import 'package:toriishopping/src/products/domain/usecases/get_products.dart';
import 'package:toriishopping/src/products/presentation/state/products_result_state.dart';
import 'package:toriishopping/src/search/domain/entities/search_filter.dart';
import 'package:toriishopping/src/suggestions/domain/entities/suggestion.dart';
import 'package:toriishopping/src/suggestions/domain/usecases/get_suggestions.dart';

class SearchProductsBloc implements BlocBase {
  static const screen_name = "Search";
  AnalyticsService _analyticsService;

  GetProductsUseCase _getProductsUseCase;
  GetSuggestionsUseCase _getSuggestionsUseCase;
  RoutesNavigator _navigator;

  final _resultsController = StreamController<ProductsResultState>.broadcast();
  final _queryController = StreamController<String>.broadcast();
  final _suggestionsController = StreamController<List<Suggestion>>.broadcast();

  StreamSink<String> get query => _queryController.sink;

  Stream<ProductsResultState> get state => _resultsController.stream;

  Stream<List<Suggestion>> get suggestions => _suggestionsController.stream;

  String _query;
  ProductsResultState _state;
  bool _searching = false;
  SearchFilter _searchFilter;

  SearchProductsBloc(this._analyticsService, this._getProductsUseCase,
      this._getSuggestionsUseCase, this._navigator) {
    _queryController.stream.listen((q) {
      _query = q;

      loadSuggestions(_query);
    });
  }

  void init() {
    notifyAnalytics();
  }

  void performSearch(SearchFilter searchFilter) async {
    if (!_searching) {
      _searching = true;

      _searchFilter = searchFilter;

      if (searchFilter.page == 1) {
        _state = ProductsResultState.empty();
      }

      _getProductsUseCase.execute(searchFilter).then((productsPage) {
        var totalItems = new List<Product>();
        totalItems.addAll(_state.result.items);
        totalItems.addAll(productsPage.items);

        _state = new ProductsResultState(false,
            PageResult(totalItems, productsPage.page, productsPage.totalPages));

        _resultsController.sink.add(_state);

        _searching = false;
      }).catchError((error) {
        _searching = false;
        _suggestionsController.sink.addError(error);
      });
    }
  }

  void loadSuggestions(String prefix) async {
    _getSuggestionsUseCase
        .execute(prefix)
        .then((suggestions) => _suggestionsController.sink.add(suggestions))
        .catchError((error) => _suggestionsController.sink.addError(error));
  }

  @override
  void dispose() {
    _resultsController.close();
    _queryController.close();
    _suggestionsController.close();
  }

  void loadMoreData() {
    if (_state.result.page < _state.result.totalPages) {
      _state = new ProductsResultState(true, _state.result);
      _resultsController.sink.add(_state);

      performSearch(new SearchFilter(
          _searchFilter.query, _searchFilter.page + 1, _searchFilter.category));
    }
  }

  void notifyAnalytics() {
    _analyticsService.sendScreenName(screen_name);
  }

  void selectProduct(Product product) {
    _navigator.push(ProductRoute(initialData: product));
  }
}
