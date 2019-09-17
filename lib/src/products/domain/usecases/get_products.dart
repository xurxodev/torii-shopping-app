import 'package:torii_shopping/src/products/domain/repositories/product_repository.dart';

import '../product.dart';

class GetProductsUseCase {
  ProductRepository _productRepository;

  GetProductsUseCase(this._productRepository);

  Future<List<Product>> execute(String query){
    return _productRepository.getProducts(query);
  }
}