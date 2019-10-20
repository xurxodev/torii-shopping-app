import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:torii_shopping/src/common/torii_colors.dart';

import 'search_box_widget.dart';

class HomeToolbarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 170.0,
      decoration: BoxDecoration(gradient: ToriiColors.backgroundGradient),
      child: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            height: 30.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Torii Shopping",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: Theme.of(context).textTheme.title.fontSize),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Image.asset('assets/icons/ic_torii_shopping.png'),
                )
              ],
            ),
          ),
          //SizedBox(height: 70.0),
          SearchBoxWidget()
        ],
      )),
    );
  }
}
