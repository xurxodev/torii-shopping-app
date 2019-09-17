import 'package:flutter/material.dart';
import 'package:torii_shopping/src/common/blocs/BlocProvider.dart';
import 'package:torii_shopping/src/products/domain/product.dart';
import 'package:torii_shopping/src/products/presentation/blocs/search_products_bloc.dart';
import 'package:torii_shopping/src/products/presentation/widgets/product_item.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SearchProductsBloc bloc =
        BlocProvider.of<SearchProductsBloc>(context);

    return StreamBuilder<List<Product>>(
      stream: bloc.results,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return buildSearchResults(context, snapshot.data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}",overflow: TextOverflow.ellipsis,);
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget buildSearchResults(BuildContext context, List<Product> searchResults) {
    return ListView(
        children: searchResults
            .map((result) => Padding(
                  padding: EdgeInsets.only(left: 4, right: 4),
                  child: ProductItem(product: result),
                ))
            .toList());
  }
}
