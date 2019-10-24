import 'package:toriishopping/src/banners/data/banner_network_repository.dart';
import 'package:toriishopping/src/banners/domain/usecases/get_banners.dart';
import 'package:toriishopping/src/browser/presentation/blocs/browser_bloc.dart';
import 'package:toriishopping/src/common/analytics/firebase_analytics_service.dart';
import 'package:toriishopping/src/common/contracts/analytics_service.dart';
import 'package:toriishopping/src/home/presentation/blocs/home_bloc.dart';
import 'package:toriishopping/src/products/data/product_network_repository.dart';
import 'package:toriishopping/src/products/domain/entities/product.dart';
import 'package:toriishopping/src/products/domain/usecases/get_product.dart';
import 'package:toriishopping/src/products/domain/usecases/get_products.dart';
import 'package:toriishopping/src/products/presentation/blocs/product_bloc.dart';
import 'package:toriishopping/src/search/presentation/blocs/search_products_bloc.dart';
import 'package:toriishopping/src/suggestions/data/suggestion_network_repository.dart';
import 'package:toriishopping/src/suggestions/domain/usecases/get_suggestions.dart';

class DependenciesProvider {
  static HomeBloc _homeBloc;
  static SearchProductsBloc _searchProductsBloc;
  static AnalyticsService _analyticsService;

  static HomeBloc provideBannersBloc() {
    if (_homeBloc == null) {
      BannerNetworkRepository repository = new BannerNetworkRepository();
      GetBannersUseCase getBannersUseCase = new GetBannersUseCase(repository);
      _homeBloc = new HomeBloc(_provideAnalyticsService(), getBannersUseCase);
    }

    return _homeBloc;
  }

  static SearchProductsBloc provideSearchProductsBloc() {
    if (_searchProductsBloc == null) {
      ProductNetworkRepository productRepository =
          new ProductNetworkRepository();
      GetProductsUseCase getProductsUseCase =
          new GetProductsUseCase(productRepository);

      SuggestionNetworkRepository suggestionsRepository =
          new SuggestionNetworkRepository();
      GetSuggestionsUseCase getSuggestionsUseCase =
          new GetSuggestionsUseCase(suggestionsRepository);

      _searchProductsBloc =
          new SearchProductsBloc(_provideAnalyticsService(),getProductsUseCase, getSuggestionsUseCase);
    }

    return _searchProductsBloc;
  }

  static ProductBloc provideProductBloc(Product product) {
    ProductNetworkRepository productRepository = new ProductNetworkRepository();
    GetProductByAsinUseCase getProductByAsinUseCase =
        new GetProductByAsinUseCase(productRepository);

    final _productBloc = new ProductBloc(_provideAnalyticsService(),getProductByAsinUseCase);

    _productBloc.init(product);

    return _productBloc;
  }

  static BrowserBloc provideBrowserBloc() {
    return BrowserBloc(_provideAnalyticsService());
  }

  static AnalyticsService _provideAnalyticsService() {
    if (_analyticsService == null) {
      _analyticsService = FirebaseAnalyticsService();
    }

    return _analyticsService;
  }


}
