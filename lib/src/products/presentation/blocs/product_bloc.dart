import 'dart:async';
import 'package:toriishopping/src/common/contracts/analytics_service.dart';
import 'package:toriishopping/src/common/presentation/blocs/bloc_base.dart';
import 'package:toriishopping/src/products/domain/entities/product.dart';
import 'package:toriishopping/src/products/domain/usecases/get_product.dart';

class ProductBloc implements BlocBase {
  static const screen_name = "Product: ";
  AnalyticsService _analyticsService;

  GetProductByAsinUseCase _getProductByAsinUseCase;

  final _productController = StreamController<Product>.broadcast();

  Stream<Product> get product => _productController.stream;

  ProductBloc(this._analyticsService, this._getProductByAsinUseCase);

  Product _product;

  init(Product initProduct) {
    _product = initProduct;

    refreshData();
    notifyAnalytics();
  }

  void refreshData() async {
    _getProductByAsinUseCase.execute(_product.asin).then((product) {
      _product = product;
      _productController.sink.add(_product);
    }).catchError((error) {
      _productController.sink.addError(error);
    });
  }

  @override
  void dispose() {
    _productController.close();
  }

  void notifyAnalytics() {
    _analyticsService.sendScreenName(screen_name + _product.name);
  }
}
