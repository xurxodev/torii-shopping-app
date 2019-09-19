import 'package:flutter/material.dart';
import 'package:torii_shopping/src/common/blocs/BlocProvider.dart';
import 'package:torii_shopping/src/common/domain/page_result.dart';
import 'package:torii_shopping/src/products/domain/product.dart';
import 'package:torii_shopping/src/products/presentation/blocs/search_products_bloc.dart';
import 'package:torii_shopping/src/products/presentation/widgets/product_item.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SearchProductsBloc bloc =
        BlocProvider.of<SearchProductsBloc>(context);

    return StreamBuilder<PageResult<Product>>(
      stream: bloc.results,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return buildSearchResults(context, snapshot.data);
        } else if (snapshot.hasError) {
          return Text(
            "${snapshot.error}",
            overflow: TextOverflow.ellipsis,
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget buildSearchResults(
      BuildContext context, PageResult<Product> pageResult) {
    return Container(
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
        ),
        itemCount: pageResult.items.length,
        itemBuilder: (context, index) => Center(
          child: ProductItem(product: pageResult.items[index]),
        ),
      ),
      color: Colors.white,
    );
  }
}
