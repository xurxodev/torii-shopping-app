import 'package:flutter/material.dart';

class SearchItem extends StatelessWidget {
  final String pathImage;
  final double height;
  final double width;

  SearchItem({
    Key key,
    @required this.pathImage,
    this.height = 250.0,
    this.width = 250.0
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(pathImage)),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          shape: BoxShape.rectangle,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black38,
                blurRadius: 15.0,
                offset: Offset(0.0, 7.0))
          ]),
    );
  }
}
