import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:torii_shopping/src/search/presentation/delegates/search_products_delegate.dart';

class SearchBox extends StatelessWidget {
  static const _border = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.all(Radius.circular(10.0)));

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      child: SizedBox(
        height: 40.0,
        child: TextField(
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "Search poducts",
              contentPadding: EdgeInsets.only(top: 16.0),
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              border: InputBorder.none,
              enabledBorder: _border,
              focusedBorder: _border),
          onTap: () =>
              showSearch(context: context, delegate: SearchProductsDelegate())

          ,
        ),
      ),
    );
  }
}
