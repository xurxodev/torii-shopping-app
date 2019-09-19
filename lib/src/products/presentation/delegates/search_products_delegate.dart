import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:torii_shopping/src/common/blocs/BlocProvider.dart';
import 'package:torii_shopping/src/products/presentation/blocs/search_products_bloc.dart';
import 'package:torii_shopping/src/products/presentation/widgets/product_list.dart';

class SearchProductsDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Platform.isAndroid
            ? Icons.clear
            : CupertinoIcons.clear_circled_solid),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Platform.isAndroid ? Icons.arrow_back : CupertinoIcons.back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    SearchProductsBloc _searchProductsBloc =
        BlocProvider.of<SearchProductsBloc>(context);

    _searchProductsBloc.query.add(query);

    return ProductList();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // This method is called everytime the search term changes.
    // If you want to add search suggestions as the user enters their search term, this is the place to do that.
    return Column();
  }
}
