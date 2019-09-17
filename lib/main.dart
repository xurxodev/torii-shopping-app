import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'src/home/screens/home_screen.dart';

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
          primarySwatch: Colors.blue,
          accentColor: Colors.blueAccent
        ),
        home: HomeScreen());
  }
}
