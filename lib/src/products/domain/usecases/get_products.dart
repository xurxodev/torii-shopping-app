import 'package:toriishopping/src/common/domain/page_result.dart';
import 'package:toriishopping/src/products/domain/repositories/product_repository.dart';
import 'package:toriishopping/src/search/domain/entities/search_filter.dart';

import '../entities/product.dart';

class GetProductsUseCase {
  ProductRepository _productRepository;

  GetProductsUseCase(this._productRepository);

  Future<PageResult<Product>> execute(SearchFilter searchFilter){
    return _productRepository.getProducts(searchFilter);
  }
}