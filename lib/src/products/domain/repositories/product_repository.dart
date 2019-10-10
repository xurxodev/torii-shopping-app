import 'package:torii_shopping/src/common/domain/page_result.dart';
import 'package:torii_shopping/src/search/domain/entities/search_filter.dart';

import '../entities/product.dart';

class ProductRepository{
  // ignore: missing_return
  Future<PageResult<Product>> getProducts(SearchFilter searchFilter){}
  Future<Product> getProductByAsin(String asin){}
}