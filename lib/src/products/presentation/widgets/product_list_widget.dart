import 'package:flutter/material.dart';
import 'package:toriishopping/src/common/presentation/blocs/BlocProvider.dart';
import 'package:toriishopping/src/common/presentation/snackbar.dart';
import 'package:toriishopping/src/notifications/notifications_handler.dart';
import 'package:toriishopping/src/products/presentation/state/products_result_state.dart';
import 'package:toriishopping/src/products/presentation/widgets/product_item_widget.dart';
import 'package:toriishopping/src/search/presentation/blocs/search_products_bloc.dart';

// ignore: must_be_immutable
class ProductListWidget extends StatelessWidget {
  ScrollController _scrollController;

  SearchProductsBloc bloc;

  ProductListWidget() {
    _scrollController = new ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        bloc.loadMoreData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<SearchProductsBloc>(context);

    return NotificationsHandler(
        child: StreamBuilder<ProductsResultState>(
      stream: bloc.state,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return buildSearchResults(context, snapshot.data);
        } else if (snapshot.hasError) {
          showSnackBarPostFrame(context, snapshot.error.toString());
          return Container();
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    ));
  }

  Widget buildSearchResults(BuildContext context, ProductsResultState state) {
    return Container(
      child: ListView.separated(
        controller: _scrollController,
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
        ),
        itemCount: state.result.items.length + 1,
        itemBuilder: (context, index) {
          return buildItem(index, state);
        },
      ),
      color: Colors.white,
    );
  }

  Widget buildItem(int index, ProductsResultState state) {
    if (index == state.result.items.length && state.loading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (index < state.result.items.length) {
      return Center(
          child: ProductItemWidget(product: state.result.items[index]));
    } else {
      return Column();
    }
  }
}
