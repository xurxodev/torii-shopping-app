import 'package:torii_shopping/src/products/domain/repositories/product_repository.dart';
import '../entities/product.dart';

class GetProductByAsinUseCase {
  ProductRepository _productRepository;

  GetProductByAsinUseCase(this._productRepository);

  Future<Product> execute(String asin){
    return _productRepository.getProductByAsin(asin);
  }
}