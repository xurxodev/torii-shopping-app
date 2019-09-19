import 'package:torii_shopping/src/banners/data/banner_network_repository.dart';
import 'package:torii_shopping/src/banners/domain/usecases/get_banners.dart';
import 'package:torii_shopping/src/banners/presentation/blocs/banners_bloc.dart';
import 'package:torii_shopping/src/products/data/product_network_repository.dart';
import 'package:torii_shopping/src/products/domain/usecases/get_products.dart';
import 'package:torii_shopping/src/products/presentation/blocs/search_products_bloc.dart';

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
    if (_bannersBloc == null) {
      ProductNetworkRepository repository = new ProductNetworkRepository();
      GetProductsUseCase getProductsUseCase =
          new GetProductsUseCase(repository);
      _searchProductsBloc = new SearchProductsBloc(getProductsUseCase);
    }

    return _searchProductsBloc;
  }
}
