import 'package:torii_shopping/src/common/domain/page_result.dart';
import 'package:torii_shopping/src/products/domain/repositories/product_repository.dart';

import '../product.dart';

class GetProductsUseCase {
  ProductRepository _productRepository;

  GetProductsUseCase(this._productRepository);

  Future<PageResult<Product>> execute(String query, int page){
    return _productRepository.getProducts(query, page);
  }
}