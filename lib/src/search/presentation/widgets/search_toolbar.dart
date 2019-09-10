import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:torii_shopping/src/common/torii_colors.dart';

import 'search_box.dart';

class SearchToolbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      padding: EdgeInsets.only(top: 48.0),
      decoration: BoxDecoration(gradient: ToriiColors.backgroundGradient),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 30.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Torii Shopping",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Image.asset('assets/icons/ic_torii_shopping.png')
              ],
            ),
          ),
          //SizedBox(height: 70.0),
          SearchBox()
        ],
      ),
    );
  }
}
