import 'package:torii_shopping/src/common/domain/page_result.dart';
import 'package:torii_shopping/src/products/domain/entities/product.dart';
import 'package:torii_shopping/src/suggestions/domain/entities/suggestion.dart';

class ProductsResultState {
  final bool loading;
  final PageResult<Product> result;

  ProductsResultState(this.loading, this.result);

  factory ProductsResultState.empty() {
    return ProductsResultState(true, PageResult.empty());
  }
}
