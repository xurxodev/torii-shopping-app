import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:torii_shopping/src/common/domain/page_result.dart';
import 'package:torii_shopping/src/products/domain/entities/product.dart';
import 'package:torii_shopping/src/products/domain/repositories/product_repository.dart';
import 'package:torii_shopping/src/search/domain/entities/search_filter.dart';

class ProductNetworkRepository implements ProductRepository {
  @override
  Future<PageResult<Product>> getProducts(SearchFilter searchFilter) async {
    return await _fetchProducts(searchFilter);
  }

  Future<PageResult<Product>> _fetchProducts(SearchFilter searchFilter) async {
    try {
      String request = _createRequest(searchFilter);

      final response = await http.get(request);

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
    String request ="https://torii-shopping-api.herokuapp.com/v1/products";

    request = request + "?q=${searchFilter.query}";

    request = request + "&page=${searchFilter.page}";

    if (searchFilter.category.isNotEmpty){
      request = request+ "&category=${searchFilter.category}";
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

    (json['images'] as List).forEach((i) => images.add(i));

    return new Product(json['asin'], json['description'], json['ean'], images,
        json['name'], json['upc'], json['url']);
  }
}
