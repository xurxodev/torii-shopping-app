import 'dart:convert';

import 'package:torii_shopping/src/common/data/api_resository.dart';
import 'package:torii_shopping/src/common/domain/page_result.dart';
import 'package:torii_shopping/src/products/domain/entities/product.dart';
import 'package:torii_shopping/src/products/domain/entities/productPrice.dart';
import 'package:torii_shopping/src/products/domain/repositories/product_repository.dart';
import 'package:torii_shopping/src/search/domain/entities/search_filter.dart';

class ProductNetworkRepository extends ApiRepository
    implements ProductRepository {
  @override
  Future<PageResult<Product>> getProducts(SearchFilter searchFilter) async {
    return await _fetchProducts(searchFilter);
  }

  Future<PageResult<Product>> _fetchProducts(SearchFilter searchFilter) async {
    try {
      String request = _createRequest(searchFilter);

      final response = await super.get(request);

      if (response.statusCode == 200) {
        // If server returns an OK response, parse the JSON.
        final decodedJson = json.decode(response.body);
        return _parse(decodedJson);
      } else {
        // If that response was not OK, throw an error.
        throw Exception('Failed to load post');
      }
    } on Exception catch (e) {
      print(e);
      throw e;
    }
  }

  String _createRequest(SearchFilter searchFilter) {
    String request = "/products";

    request = request + "?q=${searchFilter.query}";

    request = request + "&page=${searchFilter.page}";

    if (searchFilter.category.isNotEmpty) {
      request = request + "&category=${searchFilter.category}";
    }
    return request;
  }

  PageResult<Product> _parse(Map<String, dynamic> json) {
    List<Product> products = new List<Product>();

    (json['items'] as List).forEach((i) => products.add(_parseProduct(i)));

    return PageResult(products, json['page'], json['totalPages']);
  }

  Product _parseProduct(Map<String, dynamic> json) {
    List<String> images = new List<String>();
    List<ProductPrice> prices = new List<ProductPrice>();

    (json['images'] as List).forEach((i) => images.add(i));
    (json['prices'] as List).forEach((price) => prices.add(_parsePrice(price)));

    return new Product(json['asin'], json['description'], json['ean'], images,
        json['name'], json['upc'], json['url'],prices);
  }

  ProductPrice _parsePrice(Map<String, dynamic> json) {
    return new ProductPrice(json['store'], json['storeImage'], json['url'],
        json['price'], json['currency']);
  }
}
