import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:torii_shopping/src/common/blocs/BlocProvider.dart';
import 'package:torii_shopping/src/products/presentation/widgets/product_list.dart';
import 'package:torii_shopping/src/search/domain/entities/search_filter.dart';
import 'package:torii_shopping/src/search/presentation/blocs/search_products_bloc.dart';
import 'package:torii_shopping/src/suggestions/presentation/widgets/suggestions_list.dart';

class SearchProductsDelegate extends SearchDelegate {
  SearchFilter _searchFilter;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Platform.isAndroid
            ? Icons.clear
            : CupertinoIcons.clear_circled_solid),
        onPressed: () {
          query = '';
          _searchFilter = new SearchFilter(query);
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

    _searchProductsBloc.performSearch(_searchFilter);

    return ProductList();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    SearchProductsBloc _searchProductsBloc =
        BlocProvider.of<SearchProductsBloc>(context);

    _searchFilter = new SearchFilter(query);
    _searchProductsBloc.query.add(query);

    return SuggestionsList(
      onSuggestionSelected: (s) {
        query = s.value;

        String category = "";

        if (s.suggestionCategories.length > 0) {
          category = s.suggestionCategories[0].value;
        }

        _searchFilter = new SearchFilter(query, 1, category);
        this.showResults(context);
      },
    );
  }
}
