import 'package:flutter/material.dart';

class ToriiCardImage extends StatelessWidget {
  final String pathImage;

  ToriiCardImage({Key key, @required this.pathImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      height: 250.0,
      margin: EdgeInsets.fromLTRB(16.0,8.0,16.0,8.0),
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
