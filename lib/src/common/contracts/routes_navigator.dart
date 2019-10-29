import 'package:flutter/material.dart';

abstract class RoutesNavigator {
  void push(Route route);

  void pop();
}

typedef RouteAction = void Function(BuildContext context);

abstract class Route {}

abstract class ActionRoute implements Route {
  RouteAction action();
}

abstract class PageRoute implements Route {
  WidgetBuilder builder();
}
