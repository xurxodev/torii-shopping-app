import 'package:torii_shopping/src/common/domain/page_result.dart';
import 'package:torii_shopping/src/products/domain/product.dart';

class SearchProductsState {
  final bool loading;
  final PageResult<Product> result;

  SearchProductsState(this.loading, this.result);

  factory SearchProductsState.empty(){
    return SearchProductsState(true,PageResult.empty());
  }
}
