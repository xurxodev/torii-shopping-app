import 'package:toriishopping/src/common/domain/page_result.dart';
import 'package:toriishopping/src/search/domain/entities/search_filter.dart';

import '../entities/product.dart';

class ProductRepository{
  // ignore: missing_return
  Future<PageResult<Product>> getProducts(SearchFilter searchFilter){}
  // ignore: missing_return
  Future<Product> getProductByAsin(String asin){}
}