import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:toriishopping/src/browser/presentation/blocs/browser_bloc.dart';
import 'package:toriishopping/src/browser/presentation/screens/browser_screen.dart';
import 'package:toriishopping/src/common/contracts/routes_navigator.dart'
    as MyRoutes;
import 'package:toriishopping/src/common/di/depdendencies_provider.dart';
import 'package:toriishopping/src/home/screens/home_screen.dart';
import 'package:toriishopping/src/products/domain/entities/product.dart';
import 'package:toriishopping/src/products/presentation/blocs/product_bloc.dart';
import 'package:toriishopping/src/products/presentation/screens/product_screen.dart';
import 'package:toriishopping/src/search/presentation/delegates/search_products_delegate.dart';

import '../blocs/BlocProvider.dart';

class DefaultNavigator implements MyRoutes.RoutesNavigator {
  BuildContext context;

  DefaultNavigator(this.context);

  @override
  void pop() {
    Navigator.pop(context);
  }

  @override
  void push(MyRoutes.Route route) {
    if (route is MyRoutes.ActionRoute) {
      route.action();
    } else if (route is MyRoutes.PageRoute) {
      Navigator.push(context, MaterialPageRoute(builder: route.builder()));
    }
  }
}

class HomeRoute implements MyRoutes.PageRoute {
  @override
  WidgetBuilder builder() {
    return (context) => new HomeScreen();
  }
}

class SearchRoute implements MyRoutes.ActionRoute {
  @override
  MyRoutes.RouteAction action() {
    return (context) =>
        showSearch(context: context, delegate: SearchProductsDelegate(context));
  }
}

class ProductRoute implements MyRoutes.PageRoute {

  Product initialData;

  ProductRoute({this.initialData});

  @override
  builder() {
    return (context) => BlocProvider<ProductBloc>(
      bloc: DependenciesProvider.provideProductBloc(initialData),
      child: ProductScreen(initialData: initialData,),
    );
  }
}

class BrowserRoute implements MyRoutes.PageRoute {

  String url;

  BrowserRoute(this.url);

  @override
  builder() {
    return (context) =>  BlocProvider<BrowserBloc>(
        bloc: DependenciesProvider.provideBrowserBloc(),
        child: BrowserScreen(url: url));
  }
}
