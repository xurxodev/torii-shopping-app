import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:torii_shopping/src/products/domain/product.dart';
import 'package:torii_shopping/src/products/domain/repositories/product_repository.dart';

class ProductNetworkRepository implements ProductRepository {
  @override
  Future<List<Product>> getProducts(String query) async {
    return await _fetchProducts(query);
  }

  Future<List<Product>> _fetchProducts(String query) async {
    try {
      final response = await http
          .get('https://torii-shopping-api.herokuapp.com/products?q=$query');

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

  List<Product> _parse(List<dynamic> json) {
    List<Product> products = json.map((i) => _parseProduct(i)).toList();

    return products;
  }

  Product _parseProduct(Map<String, dynamic> json) {
    List<String> images = new List<String>();

    (json['images'] as List).forEach((i) => images.add(i));

    return new Product(json['asin'], json['description'], json['ean'], images,
        json['name'], json['upc']);
  }
}
