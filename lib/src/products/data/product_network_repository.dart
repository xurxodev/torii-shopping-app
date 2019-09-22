import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:torii_shopping/src/common/domain/page_result.dart';
import 'package:torii_shopping/src/products/domain/entities/product.dart';
import 'package:torii_shopping/src/products/domain/repositories/product_repository.dart';

class ProductNetworkRepository implements ProductRepository {
  @override
  Future<PageResult<Product>> getProducts(String query, int page) async {
    return await _fetchProducts(query, page);
  }

  Future<PageResult<Product>> _fetchProducts(String query, int page) async {
    try {
      final response = await http.get(
          'https://torii-shopping-api.herokuapp.com/products?q=$query&page=$page');

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

  PageResult<Product> _parse(Map<String, dynamic> json) {
    List<Product> products = new List<Product>();

    (json['items'] as List).forEach((i) => products.add(_parseProduct(i)));

    return PageResult(products, json['page'], json['totalPages']);
  }

  Product _parseProduct(Map<String, dynamic> json) {
    List<String> images = new List<String>();

    (json['images'] as List).forEach((i) => images.add(i));

    return new Product(json['asin'], json['description'], json['ean'], images,
        json['name'], json['upc'], json['url']);
  }
}
