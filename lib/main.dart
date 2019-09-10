import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:torii_shopping/src/search/presentation/screens/search_screen.dart';
import 'src/common/torii_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Torii Shopping',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: ToriiColors.transparent,
          accentColor: Colors.blueAccent
        ),
        home: SearchScreen());
  }
}
