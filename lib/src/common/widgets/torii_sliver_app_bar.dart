import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../torii_colors.dart';
import 'torii_search_box.dart';

class ToriiSliverAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: SizedBox(
        height: 30.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Torii Shopping",
              style: TextStyle(color: Colors.white),
            ),
            Image.asset('assets/icons/ic_torii_shopping.png')
          ],
        ),
      ),
      expandedHeight: 120.0,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
          background: Container(
        decoration: BoxDecoration(gradient: ToriiColors.backgroundGradient),
        child: Column(
          children: <Widget>[
            SizedBox(height: 70.0),
            ToriiSearchBox()
          ],
        ),
      )),
    );
  }
}
