import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toriishopping/src/common/presentation/blocs/BlocProvider.dart';
import 'package:toriishopping/src/products/presentation/widgets/product_list_widget.dart';
import 'package:toriishopping/src/search/domain/entities/search_filter.dart';
import 'package:toriishopping/src/search/presentation/blocs/search_products_bloc.dart';
import 'package:toriishopping/src/suggestions/presentation/widgets/suggestions_list_widget.dart';

class SearchProductsDelegate extends SearchDelegate {
  SearchFilter _searchFilter;


  SearchProductsDelegate(BuildContext context):
    super(searchFieldLabel: "Busca productos"){
    SearchProductsBloc _searchProductsBloc =
    BlocProvider.of<SearchProductsBloc>(context);
    _searchProductsBloc.init();
  }


  @override
  ThemeData appBarTheme(BuildContext context) {
      assert(context != null);
      final ThemeData theme = Theme.of(context);
      assert(theme != null);
      return theme.copyWith(
        primaryColor: Colors.white,
        primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.blue),
        primaryColorBrightness: Brightness.light,
        primaryTextTheme: theme.textTheme,
      );
  }

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

    return ProductListWidget();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    SearchProductsBloc _searchProductsBloc =
        BlocProvider.of<SearchProductsBloc>(context);

    _searchFilter = new SearchFilter(query);
    _searchProductsBloc.query.add(query);

    return SuggestionsListWidget(
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
