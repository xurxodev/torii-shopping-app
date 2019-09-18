import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:torii_shopping/src/common/blocs/BlocProvider.dart';
import 'package:torii_shopping/src/products/data/product_network_repository.dart';
import 'package:torii_shopping/src/products/domain/product.dart';
import 'package:torii_shopping/src/products/domain/usecases/get_products.dart';
import 'package:torii_shopping/src/products/presentation/blocs/search_products_bloc.dart';
import 'package:torii_shopping/src/products/presentation/widgets/product_item.dart';

class SearchProductsDelegate extends SearchDelegate {
  SearchProductsBloc _searchProductsBloc;
  BlocProvider blocProviderResults;

  SearchProductsDelegate() {
    ProductNetworkRepository repository = new ProductNetworkRepository();
    GetProductsUseCase getProductsUseCase = new GetProductsUseCase(repository);
    _searchProductsBloc = new SearchProductsBloc(getProductsUseCase);

/*    blocProviderResults = BlocProvider<SearchProductsBloc>(
      bloc: _searchProductsBloc,
      child: ProductList(),
    );*/
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Platform.isAndroid?Icons.clear:CupertinoIcons.clear_circled_solid),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Platform.isAndroid?Icons.arrow_back:CupertinoIcons.back),
      onPressed: () {
        close(context, null);
        _searchProductsBloc.dispose();
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    _searchProductsBloc.query.add(query);

    return StreamBuilder<List<Product>>(
      stream: _searchProductsBloc.results,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return buildSearchResults(context, snapshot.data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget buildSearchResults(BuildContext context, List<Product> searchResults) {
    return Container(
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
        ),
        itemCount: searchResults.length,
        itemBuilder: (context, index) => Center(
          child: ProductItem(product: searchResults[index]),
        ),
      ),
      color: Colors.white,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // This method is called everytime the search term changes.
    // If you want to add search suggestions as the user enters their search term, this is the place to do that.
    return Column();
  }
}
