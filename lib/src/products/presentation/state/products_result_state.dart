import 'package:toriishopping/src/common/domain/page_result.dart';
import 'package:toriishopping/src/products/domain/entities/product.dart';

class ProductsResultState {
  final bool loading;
  final PageResult<Product> result;

  ProductsResultState(this.loading, this.result);

  factory ProductsResultState.empty() {
    return ProductsResultState(true, PageResult.empty());
  }
}
