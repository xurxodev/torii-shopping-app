import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toriishopping/src/common/contracts/routes_navigator.dart';
import 'package:toriishopping/src/common/presentation/navigator/default_navigator.dart';

class SearchBoxWidget extends StatelessWidget {
  static const _border = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.all(Radius.circular(10.0)));

  @override
  Widget build(BuildContext context) {
    RouteAction searchAction = SearchRoute().action();

    return Container(
      height: 40.0,
      padding: EdgeInsets.only(left: 16.0, right: 16.0),
      child: TextField(
          enableInteractiveSelection: false,
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "Busca productos",
              contentPadding: EdgeInsets.only(top: 16.0),
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              border: InputBorder.none,
              enabledBorder: _border,
              focusedBorder: _border),
          onTap: () => searchAction(context)),
    );
  }
}
