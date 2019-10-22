import 'dart:async';
import 'package:toriishopping/src/common/presentation/blocs/bloc_base.dart';
import 'package:toriishopping/src/products/domain/entities/product.dart';
import 'package:toriishopping/src/products/domain/usecases/get_product.dart';

class ProductBloc implements BlocBase {
  GetProductByAsinUseCase _getProductByAsinUseCase;

  final _productController = StreamController<Product>.broadcast();

  Stream<Product> get product => _productController.stream;

  ProductBloc(this._getProductByAsinUseCase);

  Product _product;

  initState(Product initProduct) {
    _product = initProduct;
    _productController.sink.add(_product);

    refreshData();
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
}
