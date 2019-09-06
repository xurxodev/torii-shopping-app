import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'src/common/torii_colors.dart';
import 'src/search/screens/search_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: ToriiColors.transparent,
        ),
        home: SearchScreen()
    );
  }
}
