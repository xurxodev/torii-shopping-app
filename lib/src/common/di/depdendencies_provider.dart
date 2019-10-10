import 'package:torii_shopping/src/banners/data/banner_network_repository.dart';
import 'package:torii_shopping/src/banners/domain/usecases/get_banners.dart';
import 'package:torii_shopping/src/banners/presentation/blocs/banners_bloc.dart';
import 'package:torii_shopping/src/products/data/product_network_repository.dart';
import 'package:torii_shopping/src/products/domain/entities/product.dart';
import 'package:torii_shopping/src/products/domain/usecases/get_product.dart';
import 'package:torii_shopping/src/products/domain/usecases/get_products.dart';
import 'package:torii_shopping/src/products/presentation/blocs/product_bloc.dart';
import 'package:torii_shopping/src/search/presentation/blocs/search_products_bloc.dart';
import 'package:torii_shopping/src/suggestions/data/suggestion_network_repository.dart';
import 'package:torii_shopping/src/suggestions/domain/usecases/get_suggestions.dart';

class DependenciesProvider {
  static BannersBloc _bannersBloc;
  static SearchProductsBloc _searchProductsBloc;

  static BannersBloc provideBannersBloc() {
    if (_bannersBloc == null) {
      BannerNetworkRepository repository = new BannerNetworkRepository();
      GetBannersUseCase getBannersUseCase = new GetBannersUseCase(repository);
      _bannersBloc = new BannersBloc(getBannersUseCase);
    }

    return _bannersBloc;
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
          new SearchProductsBloc(getProductsUseCase, getSuggestionsUseCase);
    }

    return _searchProductsBloc;
  }

  static ProductBloc provideProductBloc(Product product) {
    ProductNetworkRepository productRepository = new ProductNetworkRepository();
    GetProductByAsinUseCase getProductByAsinUseCase =
        new GetProductByAsinUseCase(productRepository);

    final _productBloc = new ProductBloc(getProductByAsinUseCase);

    _productBloc.initState(product);

    return _productBloc;
  }
}
